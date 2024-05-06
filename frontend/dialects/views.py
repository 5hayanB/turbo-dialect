import sys
from django.shortcuts import render

sys.path.insert(0, '../../ast_gen/ast_gen.create_parse_tree')

# Create your views here.
# Django views for the Turbo Dialect chatbot

# Import necessary modules
from django.http import HttpResponse

# from .dialects.rtl import generate_rtl_code

def index(request):
    file_path = '/home/talha/turbo-dialect/frontend/4x4_systolic_array.v'
    verilog_dict = {}

    with open(file_path, 'r') as file:
        verilog_code = file.read()  # Read the entire Verilog file as a single string
        verilog_dict['verilog_file'] = verilog_code  # Save the Verilog code as the value for the 'verilog_file' key

    context = {'verilog_dict': verilog_dict}
    return render(request, 'index.html', context)

def process_input(user_input):
    # Function to process user input
    # For example, you can perform some text processing here
    create_parse_tree(user_input)
    return user_input.upper()  # Just converting input to uppercase for demonstration

def input_view(request):
    if request.method == 'POST':
        user_input = request.POST.get('user_input', '')  # Get the user input from the POST data
        output = process_input(user_input)
        return render(request, 'index.html', {'output': output})
    return render(request, 'index.html')
