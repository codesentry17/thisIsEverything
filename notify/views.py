from django.shortcuts import render, redirect
from django.contrib import messages

from django.core.mail import send_mail
from django.contrib.auth.models import User

# Create your views here.

def filterForm(request):

    



    data = {}
    return render(request,'notify/carForm.html',data)
