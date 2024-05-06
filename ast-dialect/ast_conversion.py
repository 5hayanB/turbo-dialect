import os
class AstNode:
    def __init__(self, node_type):
        self.node_type = node_type
        self.children = []
        self.attributes = {}

def parse_ast(ast_text):
    ast_stack = [AstNode("Root")]
    current_node = ast_stack[-1]
    indent_level = 0

    lines = ast_text.strip().split('\n')
    for line in lines:
        line = line.strip()
        if not line:
            continue

        # Calculate the indentation level
        indent_level = line.count("  ")

        if ":" in line:
            key_value = line.split(":")
            key = key_value[0].strip()
            value = key_value[1].strip()
        else:
            key = line
            value = ""
            
            
        if "name" in value:
            value = "'name'"
        elif "{" in key:
            key = key.replace("{", ":")
        elif "}" in key:
            key = key.replace("}", "")
            
            
        # Split the line into key and value
        # key_value = line.split(":")
        # key = key_value[0].strip()
        # value = key_value[-1].strip()
        print(key, value)
        
        with open(dest_file_path, "w") as file:
            file.write("{}{}".format(key, value))
        

        while indent_level < current_node.attributes.get("_indent_level", 0):
            ast_stack.pop()
            current_node = ast_stack[-1]
            print("Popped", current_node)
            

        if "{" in value:
            value = value.replace("{", ":")
            current_node = AstNode(key)
            current_node.attributes[key] = value
            ast_stack[-1].children.append(current_node)
            ast_stack.append(current_node)
        elif "}" in value:
            ast_stack.pop()
            current_node = ast_stack[-1]
        else:
            current_node.attributes[key] = value

        current_node.attributes["_indent_level"] = indent_level
        # print(current_node.attributes[key] )

    return ast_stack[0]

def convert_to_calyx(node):
    calyx_code = ""

    if node.node_type == "cmpnt":
        calyx_code += "component:\n"
        for key, value in node.attributes.items():
            if key != "_indent_level":
                calyx_code += f"  {key} '{value}'\n"
        for child in node.children:
            calyx_code += convert_to_calyx(child)

    elif node.node_type == "inputs" or node.node_type == "outputs" or node.node_type == "cells" or node.node_type == "wires" or node.node_type == "ctrl":
        calyx_code += f"  {node.node_type}:\n"
        for child in node.children:
            calyx_code += convert_to_calyx(child)

    elif node.node_type.startswith("in") or node.node_type.startswith("out") or node.node_type.startswith("cell") or node.node_type.startswith("assign") or node.node_type.startswith("grp") or node.node_type.startswith("seq") or node.node_type.startswith("par") or node.node_type.startswith("if") or node.node_type.startswith("while") or node.node_type.startswith("repeat"):
        calyx_code += f"    {node.node_type}:\n"
        for key, value in node.attributes.items():
            if key != "_indent_level":
                calyx_code += f"      {key} {value}\n"

    return calyx_code

def read_ast_file(file_path):
    with open(file_path, "r") as file:
        return file.read()
def write_calyx_file(file_path, calyx_code):
    with open(file_path, "w") as dest_file:

        dest_file.write("{}{}".format(calyx_code, "\n"))
        
# Provide the path to your AST text file
ast_file_path = "/home/talha/turbo-dialect/ast_gen/templates/decompressed_ast_redesign.txt"
dest_file_path = "/home/talha/turbo-dialect/ast-dialect/gen_calyx.futil"
# Provide the path to your AST text file

ast_file_path = "/home/asghar/Documents/repos/turbo-dialect/ast_gen/templates/decompressed_ast_redesign.txt"
dest_file_path = "/home/asghar/Documents/repos/turbo-dialect/ast-dialect/gen_calyx.futil"



# try:
#     with open(ast_file_path, "r") as file:
#         ast_text = file.read()
#     parsed_ast = parse_ast(ast_text)
#     # Now you can continue with further processing of the parsed AST
#     print(parsed_ast)  # Example: printing the parsed AST
# except FileNotFoundError:
#     print(f"AST file {ast_file_path} not found")
# except ValueError as e:
#     print(f"Error parsing AST: {e}")

ast_text = read_ast_file(ast_file_path)
parsed_ast = parse_ast(ast_text)
calyx_code = convert_to_calyx(parsed_ast)
dest_file = write_calyx_file(dest_file_path,calyx_code)

dest_file = write_calyx_file(dest_file_path, calyx_code)

# print(calyx_code)



