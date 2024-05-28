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

def extract_module_name(prompt, debug=False):
    LLM.reset()
    prompts_dir = os.path.join('ast_gen', 'prompts', 'module_name')
    with open(os.path.join(prompts_dir, 'extract_name.txt')) as f:
        sys_prompt = f'ROLE:\n{f.read()}'
    while True:
        response = LLM.create_chat_completion(
            messages=[{'role': 'system', 'content': sys_prompt},
                      {'role': 'user', 'content': prompt}],
            max_tokens=None)
        if debug:
            print(f'\nmodule_name_response:\n{response}')
        if response['choices'][0]['finish_reason'] == 'stop':
            module_name = re.findall('"[a-zA-Z_][a-zA-Z_0-9]*"', response['choices'][0]['message']['content'])
            if module_name:
                break
            else:
                with open(os.path.join(prompts_dir, 'name_inclusion.txt')) as f:
                    sys_prompt = f'ROLE:\n{f.read()}'
    return module_name[0].strip('"')

def extract_input_ports(prompt, debug=False):
    LLM.reset()
    grammar = LlamaGrammar.from_file(file=os.path.join('ast_gen', 'grammar', 'vulcan_ports.gbnf'))
    prompts_path = os.path.join('ast_gen', 'prompts', 'inputs')
    with open(os.path.join(prompts_path, 'identify_inputs.txt')) as f:
        sys_prompt = f'ROLE:\n{f.read()}'
    while True:
        response = LLM.create_chat_completion(
            messages=[{'role': 'system', 'content': sys_prompt},
                      {'role': 'user', 'content': prompt}],
            max_tokens=None)
        if debug:
            print(f'\nidentified_inputs:\n{response}')
        if response['choices'][0]['finish_reason'] == 'stop':
            identified_inputs = f'EXPLANATION:\n{response["choices"][0]["message"]["content"]}'
            break
    with open(os.path.join(prompts_path, 'check_grouping.txt')) as f:
        sys_prompt = f'ROLE:\n{f.read()}'
    while True:
        response = LLM.create_chat_completion(
            messages=[{'role': 'system', 'content': sys_prompt},
                      {'role': 'user', 'content': identified_inputs}],
            max_tokens=None, grammar=grammar)
        if debug:
            print(f'\ngrouping_check:\n{response}')
        if response['choices'][0]['finish_reason'] == 'stop':
            grouping_check = f'GROUPING CHECK:\n{response["choices"][0]["message"]["content"]}'
            break
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

def parse_ast(ast_string):
    ast = {"inputs": {}, "outputs": {}, "cells": {}, "wires": [], "ctrl": [], "cmpnt": {}}
    pairs = re.findall(r"(\w+)\s*:\s*([^;]+);?", ast_string)
    current_section = None
    for key, value in pairs:
        if key in ["inputs", "outputs", "cells", "wires", "ctrl"]:
            current_section = key
        elif current_section == "inputs":
            ast["inputs"][key] = value
        elif current_section == "outputs":
            ast["outputs"][key] = value
        elif current_section == "cells":
            ast["cells"][key] = value
        elif current_section == "wires":
            ast["wires"].append({key: value})
        elif current_section == "ctrl":
            ast["ctrl"].append({key: value})
        elif key == "cmpnt":
            ast["cmpnt"]["name"] = value
    return ast

def generate_calyx_code(ast):
    calyx_code = ""
    calyx_code += f"component {ast['cmpnt']['name']} {{\n"
    calyx_code += "  input {\n"
    for key, value in ast["inputs"].items():
        calyx_code += f"    {key}: {value};\n"
    calyx_code += "  }\n"
    calyx_code += "  output {\n"
    for key, value in ast["outputs"].items():
        calyx_code += f"    {key}: {value};\n"
    calyx_code += "  }\n"
    calyx_code += "  cells {\n"
    for key, value in ast["cells"].items():
        calyx_code += f"    {key}: {value};\n"
    calyx_code += "  }\n"
    calyx_code += "  wires {\n"
    for wire in ast["wires"]:
        for key, value in wire.items():
            calyx_code += f"    {key} -> {value};\n"
    calyx_code += "  }\n"
    calyx_code += "  control {\n"
    for ctrl in ast["ctrl"]:
        for key, value in ctrl.items():
            calyx_code += f"    {key};\n"
    calyx_code += "  }\n"
    calyx_code += "}\n"
    return calyx_code

def read_ast_file(file_path):
    with open(file_path, "r") as file:
        return file.read()

def write_calyx_file(file_path, calyx_code):
    with open(file_path, "w") as dest_file:
        dest_file.write(f"{calyx_code}\n")

def convert_ast_to_calyx(ast_file_path, dest_file_path):
    ast_text = read_ast_file(ast_file_path)
    parsed_ast = parse_ast(ast_text)
    calyx_code = generate_calyx_code(parsed_ast)
    write_calyx_file(dest_file_path, calyx_code)

# Provide the path to your AST text file
ast_file_path = "/turbo-dialect/ast_gen/ast_file.txt"
dest_file_path = "/turbo-dialect/ast-dialect/gen_calyx.futil"
convert_ast_to_calyx(ast_file_path, dest_file_path)
