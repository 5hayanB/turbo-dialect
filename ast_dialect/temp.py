# def ast_to_calyx(ast):
#     """Converts the given AST to Calyx code."""

#     calyx_code = f"component {ast['name']}() -> () {{\n"

#     # Cells
#     calyx_code += "  cells {\n"
#     for cell_key, cell in ast['cells'].items():
#         params = [cell[key] for key in ['param1', 'param2'] if key in cell]
#         calyx_code += f"    {cell['name']} = {cell['class']}({', '.join(params)});\n"
#     calyx_code += "  }\n"

#     # Wires
#     calyx_code += "  wires {\n"
#     for wire_key, wire in ast['wires'].items():
#         if 'dest' in wire:
#             guard = f"{wire['grd']} ?" if 'grd' in wire else ""
#             calyx_code += f"    {wire['dest']} = {guard} {wire['src']};\n"
#         else:  # It's a group
#             calyx_code += f"    group {wire['name']} {{\n"
#             for assign_key, assign in wire.items():
#                 if assign_key.startswith("assign"):
#                     guard = f"{assign['grd']} ?" if 'grd' in assign else ""
#                     calyx_code += f"      {assign['dest']} = {guard} {assign['src']};\n"
#             if 'done' in wire:
#                 calyx_code += f"      {wire['done']};\n"
#             calyx_code += "    }\n"
#     calyx_code += "  }\n"

#     # Control
#     calyx_code += "  control {\n"
#     for ctrl_key, ctrl in ast['ctrl'].items():
#         if ctrl_key.startswith("seq"):
#             calyx_code += f"    seq {{\n      {ctrl['grp']};\n    }}\n"
#         elif ctrl_key.startswith("par"):
#             calyx_code += f"    par {{\n      {ctrl['grp']};\n    }}\n"
#         elif ctrl_key.startswith("if"):
#             else_block = f" else {{\n        {ctrl['else']};\n      }}" if 'else' in ctrl else ""
#             calyx_code += f"    if ({ctrl['port']}) {{\n      {ctrl['combGrp']};\n      {ctrl['grp']};\n    }}{else_block}\n"
#         elif ctrl_key.startswith("while"):
#             calyx_code += f"    while ({ctrl['port']}) {{\n      {ctrl['combGrp']};\n      {ctrl['grp']};\n    }}\n"
#         elif ctrl_key.startswith("repeat"):
#             calyx_code += f"    repeat ({ctrl['num']}) {{\n      {ctrl['grp']};\n    }}\n"
#     calyx_code += "  }\n"

#     calyx_code += "}\n"
#     return calyx_code

# # Example AST (replace with your actual AST)
# ast = {
    # 'name': 'main',
    # 'comb': False,
    # 'inputs': {
    #     'in1_0': {'name': 'in1', 'width': 1},
    #     'in2_0': {'name': 'in2', 'width': 1}
    # },
    # 'outputs': {
    #     'out1_0': {'name': 'out1', 'width': 1},
    #     'out2_0': {'name': 'out2', 'width': 1}
    # },
    # 'cells': {
    #     'cell0_0': {'name': 'r', 'class': 'std_reg', 'param1': '32'}
    # },
    # 'wires': {
    #     'assign1_0': {'dest': 'r.in', 'src': 'in1', 'grd': 'in2'},
    #     'grp1_0': {
    #         'name': 'my_group',
    #         'assign2_0': {'dest': 'out1', 'src': 'r.out', 'grd': 'in1'},
    #         'assign3_0': {'dest': 'out2', 'src': 'in2'},
    #         'done': 'r.done'
    #     }
    # },
    # 'ctrl': {
    #     'seq1_0': {'grp': 'my_group'},
    #     'par1_0': {'grp': 'my_group'},
    #     'if1_0': {'port': 'in1', 'combGrp': 'my_group', 'grp': 'my_group', 'else': 'other_group'},
    #     'while1_0': {'port': 'in2', 'combGrp': 'my_group', 'grp': 'my_group'},
    #     'repeat1_0': {'num': 1, 'grp': 'my_group'}
    # }
# }

# # Convert AST to Calyx
# calyx_code = ast_to_calyx(ast)
# print(calyx_code)


def ast_to_calyx(ast):
    """
    Converts an AST in the given format to Calyx code.

    Args:
        ast: The AST as a dictionary.

    Returns:
        A string containing the Calyx code.
    """

    calyx_code = f"component {ast['name']}("

    # Inputs
    inputs = ", ".join(f"{input_['name']}:{input_['width']}" for input_ in ast['inputs'].values())
    calyx_code += inputs + ") -> ("

    # Outputs
    outputs = ", ".join(f"{output_['name']}:{output_['width']}" for output_ in ast['outputs'].values())
    calyx_code += outputs + ") {\n"

    # Cells
    calyx_code += "    cells {\n"
    for cell_name, cell in ast['cells'].items():
        calyx_code += f"        {cell['name']} = {cell['class']}({cell.get('param1', '')});\n"
    calyx_code += "    }\n"

    # Wires
    calyx_code += "    wires {\n"
    for wire_name, wire in ast['wires'].items():
        if 'dest' in wire:
            calyx_code += f"        {wire['dest']} = {wire['src']};\n"
        else:
            calyx_code += f"        group {wire['name']} {{\n"
            for assign_name, assign in wire.items():
                if assign_name.startswith('assign'):
                    calyx_code += f"            {assign['dest']} = {assign['src']};\n"
            calyx_code += "        }\n"
    calyx_code += "    }\n"

    # Control
    calyx_code += "    control {\n"
    for ctrl_name, ctrl in ast['ctrl'].items():
        calyx_code += f"        {ctrl['grp']};\n"
    calyx_code += "    }\n"

    calyx_code += "}\n"

    return calyx_code

# Example usage (replace with your actual AST)
ast = {
    'name': 'main',
    'comb': False,
    'inputs': {
        'in1_0': {'name': 'in1', 'width': 1},
        'in2_0': {'name': 'in2', 'width': 1}
    },
    'outputs': {
        'out1_0': {'name': 'out1', 'width': 1},
        'out2_0': {'name': 'out2', 'width': 1}
    },
    'cells': {
        'cell0_0': {'name': 'r', 'class': 'std_reg', 'param1': '32'}
    },
    'wires': {
        'assign1_0': {'dest': 'r.in', 'src': 'in1', 'grd': 'in2'},
        'grp1_0': {
            'name': 'my_group',
            'assign2_0': {'dest': 'out1', 'src': 'r.out', 'grd': 'in1'},
            'assign3_0': {'dest': 'out2', 'src': 'in2'},
            'done': 'r.done'
        }
    },
    'ctrl': {
        'seq1_0': {'grp': 'my_group'},
        'par1_0': {'grp': 'my_group'},
        'if1_0': {'port': 'in1', 'combGrp': 'my_group', 'grp': 'my_group', 'else': 'other_group'},
        'while1_0': {'port': 'in2', 'combGrp': 'my_group', 'grp': 'my_group'},
        'repeat1_0': {'num': 1, 'grp': 'my_group'}
    }
}

calyx_code = ast_to_calyx(ast)
print(calyx_code)