from django.shortcuts import render

# Create your views here.
# Django views for the Turbo Dialect chatbot

# Import necessary modules
from django.http import HttpResponse

# from .dialects.rtl import generate_rtl_code

def index(request):
    
    return render(request, 'index.html')