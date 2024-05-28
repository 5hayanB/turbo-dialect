import random
from ast_gen.ast_gen import create_vulcan_module
from ast_dialect.gen_calyx import gen_calyx


random.seed(4)
DEBUG = True


def get_prompt(file):
    with open(file, 'r', encoding='utf-8') as f:
        prompt = f.read()
    return prompt


if __name__ == '__main__':
    prompt = get_prompt('./tests/input_prompts/2x2_systolic_array.txt')
    vulcan_module = create_vulcan_module(prompt, debug=DEBUG)
    gen_calyx(*vulcan_module, random.randint(0, 9), debug=DEBUG)

