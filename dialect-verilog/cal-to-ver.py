import os
import subprocess

def convert_futil_to_verilog(futil_file_path, output_file_name, turbo_dialect_path, calyx_path):
    # Check if the input file exists
    if not os.path.isfile(futil_file_path):
        print(f"Error: The file '{futil_file_path}' does not exist.")
        return

    # Define the directories and file paths
    verilog_directory = os.path.join(turbo_dialect_path, 'verilog')
    output_file_path = os.path.join(verilog_directory, output_file_name)

    # Create the folder if it doesn't exist
    os.makedirs(verilog_directory, exist_ok=True)

    # Debug statements
    print("Current working directory:", os.getcwd())
    print("Is 'verilog' folder already present?", os.path.exists(verilog_directory))
    print("Is 'calyx' folder already present?", os.path.exists(calyx_path))

    # Define the command to convert futil to verilog and run optimizations
    command = f"fud e {futil_file_path} --to verilog --from calyx > {output_file_path}"
    
    # Run the command from the calyx directory
    result = subprocess.run(command, shell=True, capture_output=True, text=True, cwd=calyx_path)

    # Debug statement for subprocess result
    print("Command executed:", command)
    print("Return code:", result.returncode)
    if result.returncode != 0:
        print("Error output:", result.stderr)
    else:
        print("Conversion and optimization successful.")

def read_verilog(verilog_file_name, turbo_dialect_path):
    verilog_file_path = os.path.join(turbo_dialect_path, 'verilog', verilog_file_name)
    with open(verilog_file_path, 'r') as file:
        verilog_code = file.read()
    return verilog_code

# Example usage
if __name__ == "__main__":
    futil_file_path = input("Enter the path to your .futil file: ")
    output_file_name = input("Enter the desired output file name (e.g., output.v): ")
    turbo_dialect_path = input("Enter the path to the turbo-dialect directory: ")
    calyx_path = input("Enter the path to the calyx directory: ")
    
    convert_futil_to_verilog(futil_file_path, output_file_name, turbo_dialect_path, calyx_path)
    verilog_code = read_verilog(output_file_name, turbo_dialect_path)
    print(verilog_code)
