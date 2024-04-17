from llama_cpp import Llama, LlamaGrammar

from models import MODELS


# load grammar
GRAMMAR_FILE = 'ast_gen/grammar/compressed_ast.gbnf'
GRAMMAR = LlamaGrammar.from_file(file=GRAMMAR_FILE)

# load model
# MODEL = MODELS['mistral-7b-v0.1.Q8']
# LLM = Llama(model_path=MODEL['path'], n_ctx=MODEL['n_ctx'], n_gpu_layers=-1)
MODEL = MODELS['openhermes-2.5-mistral-7b-16k.Q8']
LLM = Llama(model_path=MODEL['path'], n_ctx=MODEL['n_ctx'], n_gpu_layers=-1, chat_format='chatml')


def get_ast(prompt, grammar_file, role_file, template_file, description_file):
    grammar = LlamaGrammar.from_file(file=grammar_file)

    with open(role_file, 'r', encoding='utf-8') as f:
        role = f.read()
    with open(template_file, 'r', encoding='utf-8') as f:
        template = f.read()
    with open(description_file, 'r', encoding='utf-8') as f:
        description = f.read()
    sys_prompt = f'{role}{template}{description}'

    # response = LLM.create_completion(
    #     SYSTEM_PROMPT + prompt,
    #     grammar=GRAMMAR,
    #     max_tokens=None,
    #     stop=['\n']
    # )
    # ast = response['choices'][0]['text']
    while True:
        response = LLM.create_chat_completion(
            messages=[
                {'role': 'system', 'content': sys_prompt},
                {'role': 'user', 'content': prompt}
            ],
            grammar=grammar,
            max_tokens=None,
            stop=['\n']
        )
        if response['choices'][0]['finish_reason'] == 'stop':
            break
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
    print(f'{top_module_ast = }')
    print(f'{io_ast = }')
