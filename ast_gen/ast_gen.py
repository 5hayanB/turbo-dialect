from llama_cpp import Llama, LlamaGrammar

from models import MODELS


# load model
MODEL = MODELS['meta-llama-3-8b-instruct']
LLM = Llama(
    model_path=MODEL['path'],
    n_ctx=MODEL['n_ctx'],
    n_gpu_layers=MODEL['n_gpu_layers'],
    # chat_format=MODEL['template']
)


def get_ast(prompt, grammar_file, role_file, description_file, template_file):
    grammar = LlamaGrammar.from_file(file=grammar_file)

    with open(role_file, 'r', encoding='utf-8') as f:
        role = f.read()
    with open(template_file, 'r', encoding='utf-8') as f:
        template = f.read()
    with open(description_file, 'r', encoding='utf-8') as f:
        description = f.read()
    sys_prompt = f'{role}{template}{description}'
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
    #     if response['choices'][0]['finish_reason'] == 'stop':
    #         break
    # print(f'{response = }')
    return response['choices'][0]['message']['content']


def create_parse_tree(prompt):
    top_module_ast = get_ast(
        prompt,
        grammar_file='ast_gen/grammar/top_module_ast.gbnf',
        role_file='ast_gen/prompts/top_module_role.txt',
        template_file='ast_gen/prompts/top_module_ast_template.txt',
        description_file='ast_gen/prompts/top_module_ast_description.txt'
    )
    io_ast = get_ast(
        prompt,
        grammar_file='ast_gen/grammar/io_ast.gbnf',
        role_file='ast_gen/prompts/io_role.txt',
        template_file='ast_gen/prompts/io_ast_template.txt',
        description_file='ast_gen/prompts/io_ast_description.txt'
    )
    cell_ast = get_ast(
        prompt,
        grammar_file='ast_gen/grammar/cells_ast.gbnf',
        role_file='ast_gen/prompts/cells_role.txt',
        template_file='ast_gen/prompts/cells_ast_template.txt',
        description_file='ast_gen/prompts/cells_ast_description.txt'
    )
    wires_ast = get_ast(
        prompt,
        grammar_file='ast_gen/grammar/wires_ast.gbnf',
        role_file='./prompts/wires_role.txt',
        template_file='./prompts/wires_ast_template.txt',
        description_file='./prompts/wires_ast_description.txt'
    )
    print(f'{top_module_ast = }')
    print(f'{io_ast = }')
    print(f'{cell_ast = }')

   # vulcan_code = get_ast(
     #   prompt,
      #  grammar_file='ast_gen/grammar/vulcan.gbnf',
       # role_file='ast_gen/prompts/role.txt',
        #description_file='ast_gen/prompts/vulcan.txt'
    #)
    # print(f'{vulcan_code = }')

