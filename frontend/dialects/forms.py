# frontend/dialects/forms.py
from django import forms

class ConversionForm(forms.Form):
    futil_file_path = forms.CharField(label='FuTIL File Path', max_length=255)
    output_folder_path = forms.CharField(label='Output Folder Path', max_length=255, required=False)
    output_file_name = forms.CharField(label='Output File Name', max_length=255)

