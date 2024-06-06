import os, re
from llama_cpp import Llama, LlamaGrammar

from models import MODELS


# load model
MODEL = MODELS['meta-llama-3-8b-instruct']
LLM = Llama(model_path=MODEL['path'], n_ctx=MODEL['n_ctx'], n_gpu_layers=MODEL['n_gpu_layers'])


def llm_response(sys_prompt, user_prompt, debug, debug_msg='',
                 grammar=None):
    while True:
        if grammar:
            response = LLM.create_chat_completion(
                messages=[{'role': 'system', 'content': sys_prompt},
                          {'role': 'user', 'content': user_prompt}],
                max_tokens=None, grammar=grammar)
        else:
            response = LLM.create_chat_completion(
                messages=[{'role': 'system', 'content': sys_prompt},
                          {'role': 'user', 'content': user_prompt}],                                   
                max_tokens=None)
        if debug:
            print(f'\n{debug_msg}_sys_prompt:\n{sys_prompt}')
            print(f'\n{debug_msg}_user_prompt:\n{user_prompt}')
            print(f'\n{debug_msg}_response:\n{response}')
            print(f'\n{debug_msg}_response:\n{response["choices"][0]["message"]["content"]}')
        if response['choices'][0]['finish_reason'] == 'stop':
            break
    return response['choices'][0]['message']['content']


def retrieve_conclusion(response, debug):
    sys_prompt_file = os.path.join('ast_gen', 'prompts', 'helpers', 'ensure_conclusion.txt')
    with open(sys_prompt_file, 'r', encoding='utf-8') as f:
        sys_prompt = f.read()
    while True:
        if 'CONCLUSION' in response:
            conclusion_pos = response.index('CONCLUSION') + 9
            # Consume non-whitespace characters
            while re.match(r'\S', response[conclusion_pos+1]):
                conclusion_pos += 1
            # Consume whitespace characters
            while re.match(r'\s', response[conclusion_pos+1]):
                conclusion_pos += 1
            if debug:
                print(f'\nconclusion:\n{response[conclusion_pos+1:]}')
            return response[conclusion_pos+1:]
        else:
            response = f'EXPLANATION:\n{response}'
            response = llm_response(sys_prompt, response, debug, 'ensure_conclusion')


def extract_module_name(prompt, debug):
    LLM.reset()
    prompts_dir = os.path.join('ast_gen', 'prompts', 'module_name')
    sys_prompt_file = os.path.join(prompts_dir, 'extract_name.txt')
    while True:
        with open(sys_prompt_file, 'r', encoding='utf-8') as f:
            sys_prompt = f'ROLE:\n{f.read()}'
        module_name = llm_response(sys_prompt, prompt, debug, 'module_name')
        module_name = re.findall('"[a-zA-Z_][a-zA-Z_0-9]*"', module_name)
        if module_name:
            break
        else:
            sys_prompt_file = os.path.join(prompts_dir, 'name_inclusion.txt')
    return module_name[0].strip('"')


def extract_ports(prompt, ports, debug):
    LLM.reset()
    prompts_dir = os.path.join('ast_gen', 'prompts', ports)
    # Identify ports
    sys_prompt_file = os.path.join(prompts_dir, f'identify_{ports}.txt')
    with open(sys_prompt_file, 'r', encoding='utf-8') as f:
        sys_prompt = f'ROLE:{f.read()}'
    response = llm_response(sys_prompt, prompt, debug, f'identified_{ports}')
    conclusion = retrieve_conclusion(response, debug)
    identified_ports = f'IDENTIFIED {ports[: -1].upper()} PORTS:\n{conclusion}\n'
    # Indicate grouping
    sys_prompt_file = os.path.join(prompts_dir, f'indicate_{ports}_grouping.txt')
    with open(sys_prompt_file, 'r', encoding='utf-8') as f:
        sys_prompt = f'ROLE:\n{f.read()}'
    response = llm_response(sys_prompt, identified_ports, debug, f'{ports}_grouping_indication')
    conclusion = retrieve_conclusion(response, debug)
    port_grouping_indication = f'GROUPING INDICATION:\n{conclusion}\n'
    # Assign variables
    sys_prompt_file = os.path.join(prompts_dir, f'assign_{ports}_variables.txt')
    with open(sys_prompt_file, 'r', encoding='utf-8') as f:
        sys_prompt = f'ROLE:\n{f.read()}'
    response = llm_response(sys_prompt, identified_ports+port_grouping_indication, debug, f'assign_{ports}_variables')
    conclusion = retrieve_conclusion(response, debug)
    input_ports = str(re.findall(r'[a-zA-Z_][a-zA-Z0-9_]*(?:\[\d+\])?:\d+', conclusion))
    print(f'{input_ports = }')
    assign_input_variables = f'INPUT PORTS:\n{response}'
    # # Input ports
    # sys_prompt_file = 'input_ports.txt'
    # while True:
    #     grammar = LlamaGrammar.from_file(file=os.path.join('ast_gen', 'grammar', 'vulcan_ports.gbnf'))
    #     input_ports = llm_response(prompts_dir, sys_prompt_file, assign_input_variables, debug,
    #                                'input_ports', grammar)
    #     # Check inputs
    #     check_inputs = f'{assign_input_variables}\nGENERATED INPUT PORTS:\n{input_ports}'
    #     response = llm_response(prompts_dir, 'check_inputs.txt', check_inputs, debug,
    #                             'check_inputs').lower()
    #     if 'true' in response:
    #         break
    #     sys_prompt_file = 'inputs_correction.txt'
    # return input_ports


def create_vulcan_module(prompt, debug):
    circuit_description = f'CIRCUIT DATAFLOW DESCRIPTION:\n{prompt}'
    module_name = extract_module_name(circuit_description, debug)
    inputs = extract_ports(circuit_description, 'inputs', debug)
    # outputs = extract_ports(circuit_description, 'outputs', debug)
    if debug:
        print(f'{module_name = }')
        print(f'{inputs = }')
        # print(f'{outputs = }')
    return module_name, inputs#, outputs

