from ast_gen.ast_gen import create_vulcan_module


def get_prompt(file):
    with open(file, 'r', encoding='utf-8') as f:
        prompt = f.read()
    return prompt


if __name__ == '__main__':
    prompt = get_prompt('tests/input_prompts/processing_element.txt')
    create_vulcan_module(prompt, debug=True)

