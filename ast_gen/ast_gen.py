from llama_cpp import Llama, LlamaGrammar

from models import MODELS


# load grammar
GRAMMAR_FILE = 'ast_gen/grammar/compressed_ast.gbnf'
GRAMMAR = LlamaGrammar.from_file(file=GRAMMAR_FILE)

# load system prompts
with open('ast_gen/prompts/role.txt', 'r', encoding='utf-8') as f:
    ROLE = f.read()

# load model
# MODEL = MODELS['mistral-7b-v0.1.Q8']
# LLM = Llama(model_path=MODEL['path'], n_ctx=MODEL['n_ctx'], n_gpu_layers=-1)
MODEL = MODELS['openhermes-2.5-mistral-7b-16k.Q8']
LLM = Llama(model_path=MODEL['path'], n_ctx=MODEL['n_ctx'], n_gpu_layers=-1, chat_format='chatml')


def get_ast(prompt, template_file, description_file, grammar_file):
    with open(template_file, 'r', encoding='utf-8') as f:
        template = f.read()
    with open(description_file, 'r', encoding='utf-8') as f:
        description = f.read()
    sys_prompt = f'{ROLE}{template}{description}'

    grammar = LlamaGrammar.from_file(file=grammar_file)
    # response = LLM.create_completion(
    #     SYSTEM_PROMPT + prompt,
    #     grammar=GRAMMAR,
    #     max_tokens=None,
    #     stop=['\n']
    # )
    response = LLM.create_chat_completion(
        messages=[
            {'role': 'system', 'content': sys_prompt},
            {'role': 'user', 'content': prompt}
        ],
        grammar=grammar,
        max_tokens=None,
        stop=['\n']
    )
    # ast = response['choices'][0]['text']
    return response['choices'][0]['message']['content']


def create_parse_tree(prompt):
    top_module_ast = get_ast(prompt, 'ast_gen/prompts/top_module_ast_template.txt', 'ast_gen/prompts/top_module_ast_description.txt', 'ast_gen/grammar/top_module_ast.gbnf')
    print(f'{top_module_ast = }')

    io_ast = get_ast(prompt, 'ast_gen/prompts/io_ast_template.txt', 'ast_gen/prompts/io_ast_description.txt', 'ast_gen/grammar/io_ast.gbnf')
    print(f'{io_ast = }')

