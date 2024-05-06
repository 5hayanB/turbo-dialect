from django.shortcuts import render
import subprocess
# from importlib import import_module

# imp_file = import_module ("ast-dialect.ast_conversion.convert_to_calyx")

import sys
sys.path.insert(0, '/home/talha/turbo-dialect/ast-dialect/ast_conversion.convert_to_calyx')


def convert_futil_to_verilog(futil_file_path):
    command = f"fud e tests/verilog/untitled.futil --to verilog --from calyx"
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    return result.stdout

def convert_futil(request):
    if request.method == 'POST':
        futil_file_path = request.POST.get('futil_file_path')
        verilog_output = convert_futil_to_verilog(futil_file_path)
        return render(request, 'index.html', {'verilog_output': verilog_output})
    else:
        return render(request, 'index.html')
    