import re

from icecream import ic


def count_indent(string: str) -> int:
    i: int = 0
    while string[i] == ' ':
        i += 1

    return i


def unroll(i_ndx: int, f_ndx: int, cmpr_lines: list[str], blk_indent: int) -> list[str]:
    block   : list[str] = cmpr_lines[i_ndx: f_ndx]
    n       : int       = int(block[0].split(' ')[-1][: -2])
    unrolled: list[str] = []

    for i in range(n):
        for j in range(len(block)):
            if '->' in block[j]:
                temp: str = re.sub('[a-z]+[0-9]+ -> [0-9]+:\n', re.findall('[a-z]+[0-9]+', block[j])[0] + f'_{i}:\n', block[j])
                unrolled.append(temp)
            else:
                unrolled.append(block[j])

    return unrolled


def decompress(path: str) -> None:
    with open(path, 'r', encoding='UTF-8') as f:
        lines: list[str] = f.readlines()

    decmpr_lines: list[str] = []
    i: int = 0

    while i < len(lines):
        if '->' in lines[i]:
            indent_count: int  = count_indent(lines[i])
            j           : int  = i + 1

            while j < len(lines):
                if indent_count < count_indent(lines[j]):
                    j += 1
                else:
                    break

            decmpr_lines.extend(unroll(i, j, lines, indent_count))
            i = j
        else:
            decmpr_lines.append(lines[i])
            i += 1

    decmpr: str = ''.join(decmpr_lines)
    with open('../tests/decompression/decmpr.txt', 'w', encoding='UTF-8') as f:
        f.write(decmpr)


def main() -> None:
    decompress('../tests/compression/compressed1.txt')


if __name__ == '__main__':
    main()
