from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name = 'home'),
    path('', views.process_input, name = 'process_input'),
]
