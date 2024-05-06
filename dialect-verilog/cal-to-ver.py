from django.shortcuts import render
import subprocess

def convert_futil_to_verilog(futil_file_path):
    command = f"fud e {futil_file_path} --to verilog --from calyx"
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    return result.stdout

def convert_futil(request):
    if request.method == 'POST':
        futil_file_path = request.POST.get('futil_file_path')
        verilog_output = convert_futil_to_verilog(futil_file_path)
        return render(request, 'result.html', {'verilog_output': verilog_output})
    else:
        return render(request, 'convert.html')
    
