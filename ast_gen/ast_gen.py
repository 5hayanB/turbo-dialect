import re
import os
from llama_cpp import Llama, LlamaGrammar
from models import MODELS

# Load model
MODEL = MODELS['meta-llama-3-8b-instruct']
LLM = Llama(
    model_path=MODEL['path'],
    n_ctx=MODEL['n_ctx'],
    n_gpu_layers=MODEL['n_gpu_layers']
)


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
    grammar = LlamaGrammar.from_file(file=os.path.join('ast_gen', 'grammar', 'vulcan_ports.gbnf'))
    prompts_path = os.path.join('ast_gen', 'prompts', 'inputs')
    # Identify inputs
    with open(os.path.join(prompts_path, 'identify_inputs.txt')) as f:
        sys_prompt = f'ROLE:\n{f.read()}'
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
    # Check grouping
    with open(os.path.join(prompts_path, 'check_grouping.txt')) as f:
        sys_prompt = f'ROLE:\n{f.read()}'
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
    # with open(os.path.join(prompts_path, 'check_grouping.txt')) as f:
    #     sys_prompt = f'ROLE:\n{f.read()}'
    # while True:
    #     response = LLM.create_chat_completion(
    #         messages=[{'role': 'system', 'content': sys_prompt},
    #                   {'role': 'user', 'content': inputs_extract+identified_inputs}]
    #     )
    #     if debug:
    #         print(f'\ngrouping_check_response:\n{response}')
    #     if response['choices'][0]['finish_reason'] == 'stop':
    #         grouping_check = f'CHECK GROUPING\nresponse['choices']
    ports = response['choices'][0]['message']['content']
    return ports


def extract_output_ports(prompt, extraction_prompt_file, input_ports, debug=False):
    with open(os.path.join('ast_gen', 'prompts', extraction_prompt_file)) as f:
        extraction_prompt = [f'ROLE:\n{f.read()}Do not use the following input port names for the output ports:\n']

    input_port_names = [port.split(': ')[0] for port in input_ports]
    for name in input_port_names:
        extraction_prompt.append(f'* {name}\n')

    correct = False
    while not correct:
        response = LLM.create_chat_completion(
            messages=[{'role': 'system', 'content': ''.join(extraction_prompt)},
                      {'role': 'user', 'content': prompt}],
            max_tokens=None)
        print(f'{response = }')
        if response['choices'][0]['finish_reason'] == 'stop':
            output_ports = [port.lower() for port in re.findall('[a-zA-Z_0-9]+: [0-9]+', response['choices'][0]['message']['content'])]
            output_port_names = [port.split(': ')[0] for port in output_ports]
            print(f'{input_port_names = }')
            print(f'{output_port_names = }')
            for output_port_name in output_port_names:
                if output_port_name in input_port_names:
                    extraction_prompt = 'The output port names are identical to the input port names. Name them something different according to the circuit and dataflow description.'
                    break
            else:
                correct = True
    return response


def create_vulcan_module(prompt, debug=False):
    circuit_description = f'CIRCUIT AND DATAFLOW DESCRIPTION:\n{prompt}'
    module_name = extract_module_name(circuit_description, debug=debug)
    inputs = extract_input_ports(circuit_description, debug=debug)
    # outputs = extract_output_ports(circuit_description, 'extract_outputs_prompt.txt', inputs)
    print(f'{module_name = }')
    print(f'{inputs = }')
    # print(f'{outputs = }')
    # top_module_ast = get_ast(
    #     prompt,
    #     grammar_file='ast_gen/grammar/top_module_ast.gbnf',
    #     role_file='ast_gen/prompts/top_module_role.txt',
    #     template_file='ast_gen/prompts/top_module_ast_template.txt',
    #     description_file='ast_gen/prompts/top_module_ast_description.txt'
    # )
    # io_ast = get_ast(
    #     prompt,
    #     grammar_file='ast_gen/grammar/io_ast.gbnf',
    #     role_file='ast_gen/prompts/io_role.txt',
    #     template_file='ast_gen/prompts/io_ast_template.txt',
    #     description_file='ast_gen/prompts/io_ast_description.txt'
    # )
    # cell_ast = get_ast(
    #     prompt,
    #     grammar_file='ast_gen/grammar/cells_ast.gbnf',
    #     role_file='ast_gen/prompts/cells_role.txt',
    #     template_file='ast_gen/prompts/cells_ast_template.txt',
    #     description_file='ast_gen/prompts/cells_ast_description.txt'
    # )
    # wires_ast = get_ast(
    #     prompt,
    #     grammar_file='ast_gen/grammar/wires_ast.gbnf',
    #     role_file='./prompts/wires_role.txt',
    #     template_file='./prompts/wires_ast_template.txt',
    #     description_file='./prompts/wires_ast_description.txt'
    # )
    # print(f'{top_module_ast = }')
    # print(f'{io_ast = }')
    # print(f'{cell_ast = }')

