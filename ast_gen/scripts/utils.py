def dump_compressed_ast(compressed_ast, dest):
    indent = 0
    formatted_compressed_ast = ''

    for char in compressed_ast:
        if char == '{':
            formatted_compressed_ast += char
            indent += 4
            formatted_compressed_ast += f'\n{" " * indent}'
        elif char == ',':
            formatted_compressed_ast += char
            formatted_compressed_ast += f'\n{" " * indent}'
        elif char == '}':
            indent -= 4
            formatted_compressed_ast += f'\n{" " * indent}'
            formatted_compressed_ast += char
            # formatted_compressed_ast += f'\n'
        else:
            formatted_compressed_ast += char
        # print(f'{formatted_compressed_ast = }')

    with open(dest, 'w', encoding='UTF-8') as f:
        f.write(formatted_compressed_ast)


if __name__ == '__main__':
    with open('/home/shayan/repositories/my_repositories/github/turbo-dialect/ast-gen/tests/compression/generated_ast2.txt', 'r', encoding='UTF-8') as f:
        compressed_ast = f.read()
    dump_compressed_ast(compressed_ast,
                        '/home/shayan/repositories/my_repositories/github/turbo-dialect/ast-gen/tests/compression/compressed2.txt')
