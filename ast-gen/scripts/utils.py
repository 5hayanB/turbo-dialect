def dump_compressed_ast(compressed_ast, dest):
    indent = 0
    formatted_compressed_ast = ''

    for char in compressed_ast:
        if char == '{':
            formatted_compressed_ast += char
            indent += 4
            formatted_compressed_ast += f'\n{" " * indent}'
        if char == ',':
            formatted_compressed_ast += char
            formatted_compressed_ast += f'\n{" " * indent}'
        if char == '}':
            indent -= 4
            formatted_compressed_ast += f'\n{" " * indent}'
            formatted_compressed_ast += char

    with open(dest, 'r', encoding='UTF-8') as f:
        f.write(formatted_compressed_ast)
