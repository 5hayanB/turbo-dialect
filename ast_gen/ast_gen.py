import os
from llama_cpp import Llama, LlamaGrammar

from models import MODELS


# load model
# MODEL = MODELS['meta-llama-3-8b']
# MODEL = MODELS['mistral-7b-v0.1']
MODEL = MODELS['codellama-13b-instruct']
LLM = Llama(
    model_path=MODEL['path'],
    n_ctx=MODEL['n_ctx'],
    n_gpu_layers=MODEL['n_gpu_layers']
)


def get_code(prompt, grammar_file, description_file):
    grammar = LlamaGrammar.from_file(file=os.path.join('ast_gen', 'grammar', grammar_file))

    # with open(role_file, 'r', encoding='utf-8') as f:
    #     role = f.read()
    # with open(template_file, 'r', encoding='utf-8') as f:
    #     template = f.read()
    with open(os.path.join('ast_gen', 'prompts', description_file), 'r', encoding='utf-8') as f:
        sys_prompt = f.read()
    # sys_prompt = f'{role}{template}{description}'
    # sys_prompt = f'{description_file}{role}'

    # while True:
    response = LLM.create_chat_completion(
        messages=[
            {'role': 'system', 'content': sys_prompt},
            {'role': 'user', 'content': prompt}
        ],
        grammar=grammar,
        max_tokens=None,
        stop=['\n']
    )
        # if response['choices'][0]['finish_reason'] == 'stop':
        #     break
        # print(f'{response = }')
    return response['choices'][0]['message']['content']

        # response = LLM.create_completion(sys_prompt+prompt, grammar=grammar, max_tokens=None, stop=['\n'])
        # if response['choices'][0]['finish_reason'] == 'stop':
        #     break
    # return response['choices'][0]['text']


# def get_reason(prompt, code, reason_file):
#     with open(os.path.join('ast_gen', 'prompts', reason_file), 'r', encoding='utf-8') as f:
#         reason_prompt = f.read()
#     sys_prompt = 
#     while True:
#         response = LLM.create_completion(sys_prompt, max_tokens=None, stop=['\n'])
#         if response['choices'][0]['finish_reason'] == 'stop':
#             break
#     return response['choices'][0]['text']


def do_reasoning(prompt, reasoning_description_file):
    with open(os.path.join('ast_gen', 'prompts', reasoning_description_file)) as f:
        reasoning_description = f.read()
    # while True:
    reasoning = LLM.create_completion(reasoning_description+prompt, max_tokens=None)
    return reasoning['choices'][0]['text']


def create_vulcan_module(prompt):
    circuit_description = f'CIRCUIT AND DATAFLOW DESCRIPTION:\n{prompt}\n'
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

    # correct = False
    # while not correct:
    # reasoning = do_reasoning(prompt, 'vulcan_module_decl_reasoning_prompt.txt')
    # print(f'{reasoning = }')
    vulcan_module_decl = get_code(prompt, grammar_file='vulcan_module_decl.gbnf', description_file='vulcan_module_decl_sys_prompt.txt')
    print(f'{vulcan_module_decl = }')

