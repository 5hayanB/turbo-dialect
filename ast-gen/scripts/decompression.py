def decompress(compressed_file):
    with open(compressed_file, 'r', encoding='UTF-8') as f:
        compressed_stream = f.read()

    decompressed_stream = []
    token = ''
    for i in range(len(compressed_stream)):
        if compressed_stream[i] == '{':
            decompressed_stream.append(token)
            decompressed_stream.append(compressed_stream[i])
        elif compressed_stream[i] == ':':
            decompressed_stream.append(token)
            decompressed_stream.append(compressed_stream[i])
        elif compressed_stream[i]+compressed_stream[i + 1] == '->':
            pass
        else:
            token += compressed_stream[i]


if __name__ == '__main__':
    decompress('../tests/compression/generated_ast2.txt')
