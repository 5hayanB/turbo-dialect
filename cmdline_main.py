from ast_gen.ast_gen import create_parse_tree


def get_prompt(file):
    with open(file, 'r', encoding='utf-8') as f:
        prompt = f.read()
    return prompt


if __name__ == '__main__':
    prompt = get_prompt('./tests/input_prompts/4x4_systolic_array_dataflow.txt')
    create_parse_tree(prompt)

