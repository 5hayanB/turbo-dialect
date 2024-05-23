# import os
# class AstNode:
#     def __init__(self, node_type):
#         self.node_type = node_type
#         self.children = []
#         self.attributes = {}

# def parse_ast(ast_text):
#     ast_stack = [AstNode("Root")]
#     current_node = ast_stack[-1]
#     indent_level = 0

#     lines = ast_text.strip().split('\n')
#     for line in lines:
#         line = line.strip()
#         if not line:
#             continue

#         # Calculate the indentation level
#         indent_level = line.count("  ")

#         if ":" in line:
#             key_value = line.split(":")
#             key = key_value[0].strip()
#             value = key_value[1].strip()
#         else:
#             key = line
#             value = ""
            
            
#         if "name" in value:
#             value = "'name'"
#         elif "{" in key:
#             key = key.replace("{", "{")
#         elif "}" in key:
#             key = key.replace("}", "}")
#         elif "cmpnt" in value:
#             value = "Component cmpnt"
            
            
#         # Split the line into key and value
#         # key_value = line.split(":")
#         # key = key_value[0].strip()
#         # value = key_value[-1].strip()
#         print(key, value)
        
#         with open(dest_file_path, "w") as file:
#             file.write("{}{}".format(key, value))
        

#         while indent_level < current_node.attributes.get("_indent_level", 0):
#             ast_stack.pop()
#             current_node = ast_stack[-1]
#             print("Popped", current_node)
            

#         if "{" in value:
#             value = value.replace("{", "{")
#             current_node = AstNode(key)
#             current_node.attributes[key] = value
#             ast_stack[-1].children.append(current_node)
#             ast_stack.append(current_node)
#         elif "}" in value:
#             ast_stack.pop()
#             current_node = ast_stack[-1]
#             value = value.replace("}", "}")
#         else:
#             current_node.attributes[key] = value

#         current_node.attributes["_indent_level"] = indent_level
#         # print(current_node.attributes[key] )
        
#     print(key, value)  
#     return ast_stack[0]

# def convert_to_calyx(node):
#     calyx_code = ""

#     if node.node_type == "cmpnt":
#         calyx_code += "component cmpnt:\n"
#         for key, value in node.attributes.items():
#             if key != "_indent_level":
#                 calyx_code += f"  {key}:'{value}'\n"
#         for child in node.children:
#             calyx_code += convert_to_calyx(child)

#     elif node.node_type == "inputs" or node.node_type == "outputs" or node.node_type == "cells" or node.node_type == "wires" or node.node_type == "ctrl":
#         calyx_code += f"  {node.node_type}:\n"
#         for child in node.children:
#             calyx_code += convert_to_calyx(child)

#     elif node.node_type.startswith("in") or node.node_type.startswith("out") or node.node_type.startswith("cell") or node.node_type.startswith("assign") or node.node_type.startswith("grp") or node.node_type.startswith("seq") or node.node_type.startswith("par") or node.node_type.startswith("if") or node.node_type.startswith("while") or node.node_type.startswith("repeat"):
#         calyx_code += f"    {node.node_type}:\n"
#         for key, value in node.attributes.items():
#             if key != "_indent_level":
#                 calyx_code += f"      {key} {value}\n"
                
#     return calyx_code



# def read_ast_file(file_path):
#     with open(file_path, "r") as file:
#         return file.read()
# def write_calyx_file(file_path, calyx_code):
#     with open(file_path, "w") as dest_file:

#         dest_file.write("{}{}".format(calyx_code, "\n"))
        
# # # Provide the path to your AST text file
# # ast_file_path = "/home/talha/turbo-dialect/ast_gen/templates/decompressed_ast_redesign.txt"
# # dest_file_path = "/home/talha/turbo-dialect/ast-dialect/gen_calyx.futil"
# # Provide the path to your AST text file

# ast_file_path = "/home/asghar/Documents/repos/turbo-dialect/tests/decompression/test.txt"
# dest_file_path = "/home/asghar/Documents/repos/turbo-dialect/ast-dialect/gen_calyx.futil"



# # try:
# #     with open(ast_file_path, "r") as file:
# #         ast_text = file.read()
# #     parsed_ast = parse_ast(ast_text)
# #     # Now you can continue with further processing of the parsed AST
# #     print(parsed_ast)  # Example: printing the parsed AST
# # except FileNotFoundError:
# #     print(f"AST file {ast_file_path} not found")
# # except ValueError as e:
# #     print(f"Error parsing AST: {e}")
# def convert_ast_to_calyx(ast_file_path, dest_file_path):
#     ast_text = read_ast_file(ast_file_path)
#     parsed_ast = parse_ast(ast_text)
#     calyx_code = convert_to_calyx(parsed_ast)
#     write_calyx_file(dest_file_path,calyx_code)
# convert_ast_to_calyx(ast_file_path, dest_file_path  )

import re

def parse_ast(ast_string):
    """Parses an AST string and returns a dictionary representing the AST."""

    ast = {"inputs": {}, "outputs": {}, "cells": {}, "wires": {}, "ctrl": {}, "cmpnt": {}}
    current_section = None
    current_group = None

    for line in ast_string.strip().splitlines():
        line = line.strip()
        if line.startswith("cmpnt{"):
            current_section = "cmpnt"
            ast[current_section] = {}
        # elif line.startswith("inputs{"):
        #     current_section = "inputs"
        #     ast[current_section] = {}
        # elif line.startswith("outputs{"):
        #     current_section = "outputs"
        #     ast[current_section] = {}
        # elif line.startswith("cells{"):
        #     current_section = "cells"
        #     ast[current_section] = {}
        elif current_section in ["inputs", "outputs", "cells"]:
            if "_" in key:
                group, index = key.split("_")
                index = int(index)
                if group not in ast[current_section]:
                    ast[current_section][group] = {}  # Create the group dictionary
                ast[current_section][group][index] = {key.split("_")[0]: value} # Create nested dictionary
            else:
                ast[current_section][key] = value
        # elif line.startswith("wires{"):
        #     current_section = "wires"
        #     ast[current_section] = {}
        elif current_section == "wires":
            key, value = line.split(" = ")
            ast["wires"].append({key: value})
        elif line.startswith("ctrl{"):
            current_section = "ctrl"
            ast[current_section] = {}
        elif line.startswith("}"):
            current_section = None
            current_group = None
        elif ":" in line:
            key, value = line.split(":", 1)
            key = key.strip()
            value = value.strip()

            if current_section == "cmpnt":
                ast[current_section][key] = value
            elif current_section in ["inputs", "outputs", "cells"]:
                if "_" in key:
                    group, index = key.split("_")
                    index = int(index)
                    if group not in ast[current_section]:
                        ast[current_section][group] = {}
                    ast[current_section][group][index] = {key.split("_")[0]: value}
                else:
                    ast[current_section][key] = value
            elif current_section == "wires":
                key,value = line.split(" = ")
                ast["wires"].append({key: value})
                if "{" in line:
                    current_group = key
                    ast[current_section][current_group] = {}
                elif current_group:
                    if "_" in key:
                        group, index = key.split("_")
                        index = int(index)
                        if group not in ast[current_section][current_group]:
                            ast[current_section][current_group][group] = {}
                        ast[current_section][current_group][group][index] = {
                            key.split("_")[0]: value
                        }
                    else:
                        ast[current_section][current_group][key] = value
                else:
                    if "_" in key:
                        group, index = key.split("_")
                        index = int(index)
                        if group not in ast[current_section]:
                            ast[current_section][group] = {}
                        ast[current_section][group][index] = {
                            key.split("_")[0]: value
                        }
                    else:
                        ast[current_section][key] = value
            elif current_section == "ctrl":
                if "{" in line:
                    current_group = key
                    ast[current_section][current_group] = {}
                elif current_group:
                    if "_" in key:
                        group, index = key.split("_")
                        index = int(index)
                        if group not in ast[current_section][current_group]:
                            ast[current_section][current_group][group] = {}
                        ast[current_section][current_group][group][index] = {
                            key.split("_")[0]: value
                        }
                    else:
                        ast[current_section][current_group][key] = value
                else:
                    if "_" in key:
                        group, index = key.split("_")
                        index = int(index)
                        if group not in ast[current_section]:
                            ast[current_section][group] = {}
                        ast[current_section][group][index] = {
                            key.split("_")[0]: value
                        }
                    else:
                        ast[current_section][key] = value

    return ast


def generate_calyx_code(ast):
    """Generates Calyx code from an AST dictionary."""
    with open("gen_calyx.futil", "w") as f:
        f.write("component main(")
        f.write(', '.join([f'{inp}: {ast["inputs"][inp]}' for inp in ast["inputs"]]))
        f.write(") -> (")
        f.write(', '.join([f'{outp}: {ast["outputs"][outp]}' for outp in ast["outputs"]]))
        f.write(")) {\n")
        calyx_code = ""

        # Component declaration
        calyx_code += f"component {ast['cmpnt']['name']} {{\n"

        # Inputs
        calyx_code += "  input {\n"
        for input_group in ast["inputs"]:
            for i, input_data in ast["inputs"][input_group].items():
                calyx_code += (
                    f"    {input_data['name']}: {input_data['width']};\n"
                )
        calyx_code += "  }\n"

        # Outputs
        calyx_code += "  output {\n"
        for output_group in ast["outputs"]:
            for i, output_data in ast["outputs"][output_group].items():
                calyx_code += (
                    f"    {output_data['name']}: {output_data['width']};\n"
                )
        calyx_code += "  }\n"

        # Cells
        # f.write(f"    {'cell_name'} = {cell_type}({cell_inputs}) -> ({cell_outputs});\n")
        # calyx_code += "  cells {\n"
        # for cell_group in ast["cells"]:
        #     for i, cell_data in ast["cells"][cell_group].items():
        #         calyx_code += f"    {cell_data['name']} = prim std_{cell_data['class']}({cell_data['param1']}, {cell_data['param2']});\n"
        # calyx_code += "  }\n"
        f.write("\n  // Cells\n")
        for cell_group in ast["cells"]:
            for cell_name, cell_data in ast["cells"][cell_group].items():
                cell_type = cell_data["type"]
                cell_inputs = ', '.join([f'{inp}: {cell_data["inputs"][inp]}' for inp in cell_data["inputs"]])
                cell_outputs = ', '.join([f'{outp}: {cell_data["outputs"][outp]}' for outp in cell_data["outputs"]])
                f.write(f"    {cell_name} = {cell_type}({cell_inputs}) -> ({cell_outputs});\n")

        # Wires
        calyx_code += "  wires {\n"
        f.write("//Wires\n")
        for wire in ast["wires"]:
            f.write(f"    {dest}: {ast['wires'][wire]['width']} = {src};\n")
        for wire_group in ast["wires"]:
            dest = list(wire.keys())[0]
            src = wire[dest]
            f.write(f"    {dest} = {src};\n")
            if isinstance(ast["wires"][wire_group], dict):
                for i, wire_data in ast["wires"][wire_group].items():
                    if isinstance(wire_data, dict):
                        for j, assign_data in wire_data.items():
                            if "grd" in assign_data:
                                calyx_code += (
                                    f"    group {wire_group} {{\n"
                                    f"      {assign_data['dest']} = {assign_data['src']} ? {assign_data['grd']};\n"
                                    f"    }}\n"
                                )
                            else:
                                calyx_code += (
                                    f"    group {wire_group} {{\n"
                                    f"      {assign_data['dest']} = {assign_data['src']};\n"
                                    f"    }}\n"
                                )
                    else:
                        calyx_code += f"    group {wire_group} {{\n"
                        calyx_code += f"      {wire_data}:\n"
                        calyx_code += f"    }}\n"
            else:
                if "grd" in ast["wires"][wire_group]:
                    calyx_code += (
                        f"    {ast['wires'][wire_group]['dest']} = {ast['wires'][wire_group]['src']} ? {ast['wires'][wire_group]['grd']};\n"
                    )
                else:
                    calyx_code += (
                        f"    {ast['wires'][wire_group]['dest']} = {ast['wires'][wire_group]['src']};\n"
                    )
        calyx_code += "  }\n"

        # Control
        calyx_code += "  control {\n"
        for ctrl_group in ast["ctrl"]:
            if isinstance(ast["ctrl"][ctrl_group], dict):
                for i, ctrl_data in ast["ctrl"][ctrl_group].items():
                    if isinstance(ctrl_data, dict):
                        if ctrl_group == "seq":
                            calyx_code += f"    seq {{\n"
                            for j, seq_data in ctrl_data.items():
                                calyx_code += f"      invoke {seq_data['grp']}();\n"
                            calyx_code += f"    }}\n"
                        elif ctrl_group == "par":
                            calyx_code += f"    par {{\n"
                            for j, par_data in ctrl_data.items():
                                calyx_code += f"      invoke {par_data['grp']}();\n"
                            calyx_code += f"    }}\n"
                        elif ctrl_group == "if":
                            calyx_code += (
                                f"    if {ctrl_data['port']} with {ctrl_data['combGrp']} {{\n"
                                f"      invoke {ctrl_data['grp']}();\n"
                                f"    }} else {{\n"
                                f"      invoke {ctrl_data['else']}();\n"
                                f"    }}\n"
                            )
                        elif ctrl_group == "while":
                            calyx_code += (
                                f"    while {ctrl_data['port']} with {ctrl_data['combGrp']} {{\n"
                                f"      invoke {ctrl_data['grp']}();\n"
                                f"    }}\n"
                            )
                        elif ctrl_group == "repeat":
                            calyx_code += (
                                f"    repeat({ctrl_data['num']}) {{\n"
                                f"      invoke {ctrl_data['grp']}();\n"
                                f"    }}\n"
                            )
                    else:
                        calyx_code += f"    {ctrl_group} {ctrl_data} {{\n"
                        calyx_code += f"    }}\n"
            else:
                calyx_code += f"    {ctrl_group} {ast['ctrl'][ctrl_group]} {{\n"
                calyx_code += f"    }}\n"
        calyx_code += "  }\n"

        calyx_code += "}\n"

    return calyx_code


# Example AST string
ast_string = """
cmpnt{
    name:my_component,
    comb:false,
    inputs{
        in1_0{
            name:in1,
            width:1
        }
        in2_0{
            name:in2,
            width:1
        }
    }
    outputs{
        out1_0{
            name:out1,
            width:1
        }
        out2_0{
            name:out2,
            width:1
        }
    }
    cells{
        cell0_0{
            name:reg1,
            class:register,
            param1:16,
            param2:0
        }
    }
    wires{
        assign1_0{
            dest:out1,
            src:in1,
            grd:in2
        }
        grp1_0{
            name:my_group,
            assign2_0{
                dest:out2,
                src:reg1.out,
                grd:in1
            }
            assign3_0{
                dest:reg1.in,
                src:in2
            }
            done:doneCond
        }
    }
    ctrl{
        seq1_0{
            grp:my_group
        }
        par1_0{
            grp:my_group
        }
        if1_0{
            port:in1,
            combGrp:my_comb_group,
            grp:my_group,
            else:my_other_group
        }
        while1_0{
            port:in2,
            combGrp:my_comb_group,
            grp:my_group
        }
        repeat1_0{
            num:1,
            grp:my_group
        }
    }
}
"""

# Parse the AST string
ast = parse_ast(ast_string)

# Generate Calyx code
calyx_code = generate_calyx_code(ast)

print(calyx_code)