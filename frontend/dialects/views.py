import sys
from django.shortcuts import render
from django.shortcuts import render, redirect


sys.path.insert(0, '../../ast_gen/ast_gen.create_parse_tree')

# Create your views here.
# Django views for the Turbo Dialect chatbot

# Import necessary modules
from django.http import HttpResponse
import os
import os

# from .dialects.rtl import generate_rtl_code


def index(request):
    file_path = '/home/asghar/Documents/repos/turbo-dialect/verilog/pe.v'
    verilog_dict = {}

    with open(file_path, 'r') as file:
        verilog_code = file.read()  # Read the entire Verilog file as a single string
        verilog_dict['verilog_file'] = verilog_code  # Save the Verilog code as the value for the 'verilog_file' key

    context = {'verilog_dict': verilog_dict}
    return render(request, 'index.html', context)


import sys
sys.path.append('/home/asghar/Documents/repos/turbo-dialect/ast_gen')
from ast_gen.ast_gen import create_vulcan_module
from ast_dialect.gen_calyx import gen_calyx
from dialect_verilog.cal_to_ver import convert_futil_to_verilog

def process_input(request):
  if request.method == 'POST':
    text_input = request.POST.get('user_input')
    # Basic validation (example, check if input is empty)
    if not text_input:
      error_message = "Please enter some text."
      return render(request, 'index.html', {'error_message': error_message})

    # Process the input (example: print it)
    # print(f"Received input: {text_input}")
    ast= create_vulcan_module(text_input, debug=False)
    result1 = ast["module_name"]
    result2 = ast["inputs"]
    result3 = ast["outputs"]
    calyx = gen_calyx(result1, result2, result3, 456,debug=False)
    verilog = convert_futil_to_verilog(calyx, 'pe.v')
    return verilog > "/home/asghar/Documents/repos/turbo-dialect/verilog/pe.v" # Redirect to a success page
  else:
    # Render the form for the first time
    return render(request, 'index.html')