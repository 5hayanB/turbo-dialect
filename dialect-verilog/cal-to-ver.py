from django.shortcuts import render
import subprocess
# from importlib import import_module

# imp_file = import_module ("ast-dialect.ast_conversion.convert_to_calyx")

import sys
sys.path.insert(0, '/home/talha/turbo-dialect/ast-dialect/ast_conversion.convert_to_calyx')


def convert_futil_to_verilog(futil_file_path ):
    command = f"fud e tests/calyxir/untitled.futil --to verilog --from calyx > tests/verilog/untitled.v "
    result = subprocess.run(command, shell=True, capture_output=True, text=True)

def read_verilog():
    with open('tests/verilog/untitled.v', 'r') as file:
        verilog_code = file.read()
    return verilog_code
    