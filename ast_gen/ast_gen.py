import os, re
from llama_cpp import Llama, LlamaGrammar

from models import MODELS


# load model
MODEL = MODELS['meta-llama-3-8b-instruct']
LLM = Llama(model_path=MODEL['path'], n_ctx=MODEL['n_ctx'], n_gpu_layers=MODEL['n_gpu_layers'])


def llm_response(sys_prompt_dir, sys_prompt_file, user_prompt, debug=False,
                 debug_msg='', grammar=None):
    with open(os.path.join(sys_prompt_dir, sys_prompt_file), 'r', encoding='utf-8') as f:
        sys_prompt = f'ROLE:\n{f.read()}'
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
            print(f'\n{debug_msg}:\n{response}')
            print(f'\n{debug_msg}:\n{response["choices"][0]["message"]["content"]}')
        if response['choices'][0]['finish_reason'] == 'stop':
            break
    return response['choices'][0]['message']['content']


def extract_module_name(prompt, debug=False):
    LLM.reset()
    prompts_dir = os.path.join('ast_gen', 'prompts', 'module_name')
    sys_prompt_file = 'extract_name.txt'
    correct = False
    while not correct:
        module_name = llm_response(prompts_dir, sys_prompt_file, prompt, debug,
                                   'module_name')
        module_name = re.findall('"[a-zA-Z_][a-zA-Z_0-9]*"', module_name)
        if module_name:
            correct = True
        else:
            sys_prompt_file = 'name_inclusion.txt'
    return module_name[0].strip('"')


def extract_input_ports(prompt, debug=False):
    LLM.reset()
    prompts_dir = os.path.join('ast_gen', 'prompts', 'inputs')
    # Identify inputs
    response = llm_response(prompts_dir, 'identify_inputs.txt', prompt, debug,
                            'identified_inputs')
    identified_inputs = f'IDENTIFIED INPUT PORTS:\n{response}'
    # Check grouping
    response = llm_response(prompts_dir, 'check_input_grouping.txt', identified_inputs, debug,
                            'input_grouping_check')
    input_grouping_check = f'IDENTIFIED INPUT PORTS:\n{response}'
    # Assign variables
    response = llm_response(prompts_dir, 'assign_input_variables.txt', input_grouping_check, debug,
                            'assign_input_variables')
    assign_input_variables = f'INPUT PORTS:\n{response}'
    # Input ports
    sys_prompt_file = 'input_ports.txt'
    while True:
        grammar = LlamaGrammar.from_file(file=os.path.join('ast_gen', 'grammar', 'vulcan_ports.gbnf'))
        input_ports = llm_response(prompts_dir, sys_prompt_file, assign_input_variables, debug,
                                   'input_ports', grammar)
        # Check inputs
        check_inputs = f'{assign_input_variables}\nGENERATED INPUT PORTS:\n{input_ports}'
        response = llm_response(prompts_dir, 'check_inputs.txt', check_inputs, debug,
                                'check_inputs').lower()
        if 'true' in response:
            break
        sys_prompt_file = 'inputs_correction.txt'
    return input_ports


def extract_output_ports(prompt, debug=False):
    LLM.reset()
    prompts_dir = os.path.join('ast_gen', 'prompts', 'outputs')
    # Identify outputs
    response = llm_response(prompts_dir, 'identify_outputs.txt', prompt, debug,
                            'identified_outputs')
    identified_outputs = f'IDENTIFIED OUTPUT PORTS:\n{response}'
    # Check grouping
    response = llm_response(prompts_dir, 'check_output_grouping.txt', identified_outputs, debug,
                            'output_grouping_check')
    output_grouping_check = f'IDENTIFIED OUTPUT PORTS:\n{response}'
    # Assign variables
    response = llm_response(prompts_dir, 'assign_output_variables.txt', output_grouping_check, debug,
                            'assign_output_variables')
    assign_output_variables = f'OUTPUT PORTS:\n{response}'
    # Output ports
    sys_prompt_file = 'output_ports.txt'
    while True:
        grammar = LlamaGrammar.from_file(file=os.path.join('ast_gen', 'grammar', 'vulcan_ports.gbnf'))
        output_ports = llm_response(prompts_dir, sys_prompt_file, assign_output_variables, debug,
                                   'output_ports', grammar)
        # Check outputs
        check_outputs = f'{assign_output_variables}\nGENERATED OUTPUT PORTS:\n{output_ports}'
        response = llm_response(prompts_dir, 'check_outputs.txt', check_outputs, debug,
                                'check_outputs').lower()
        if 'true' in response:
            break
        sys_prompt_file = 'outputs_correction.txt'
    return output_ports


def create_vulcan_module(prompt, debug=False):
    circuit_description = f'CIRCUIT AND DATAFLOW DESCRIPTION:\n{prompt}'
    module_name = extract_module_name(circuit_description, debug=debug)
    inputs = extract_input_ports(circuit_description, debug=debug)
    outputs = extract_output_ports(circuit_description, debug=debug)
    print(f'{module_name = }')
    print(f'{inputs = }')
    print(f'{outputs = }')

