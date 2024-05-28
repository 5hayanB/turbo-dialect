# frontend/dialects/utils.py
import os
import subprocess

def create_output_folder(base_path):
    output_folder_path = os.path.join(base_path, 'outputs')
    if not os.path.exists(output_folder_path):
        os.makedirs(output_folder_path)
    return output_folder_path

def convert_futil_to_verilog(futil_file_path, base_path, output_file_name=None):
    output_folder_path = create_output_folder(base_path)
    if not output_file_name:
        output_file_name = 'untitled'
    output_file_path = os.path.join(output_folder_path, f"{output_file_name}.v")
    command = f"fud e {futil_file_path} --to verilog --from calyx > {output_file_path}"
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    if result.returncode != 0:
        raise Exception(f"Error during conversion: {result.stderr}")
    else:
        print(f"Conversion successful: {output_file_path}")

def read_verilog(output_file_path):
    with open(output_file_path, 'r') as file:
        verilog_code = file.read()
    return verilog_code
