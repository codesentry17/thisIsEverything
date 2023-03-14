from datetime import datetime
from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Specification
from django.core.mail import send_mail
from django.contrib.auth.models import User

# Create your views here.

def filterForm(request):

    year = [x for x in range(2010,datetime.now().year)]

    data = {'years':year}
    return render(request,'notify/carForm.html',data)

def filterSubmit(request):

    print("This got called")
    
    if request.method == 'POST':
        user_id = request.POST['user_id']
        name = request.POST['name']
        email = request.POST['email']
        brand = request.POST['brand']
        model = request.POST['model']
        body_style = request.POST['body_style']
        fuel = request.POST['fuel']
        transmission = request.POST['transmission']
        color = request.POST['color']
        year = request.POST['year']
        milage = request.POST['milage']
        min_price = int(request.POST['min_price'])
        max_price = int(request.POST['max_price'])


        hasSpecified = Specification.objects.filter(user_id=user_id, brand=brand, model=model, body_style=body_style, fuel=fuel, transmission=transmission, color=color, year=year, milage=milage, min_price=min_price, max_price=max_price).exists()

        if hasSpecified:
            messages.error(request, 'You have already made an exact filter request...')
            return redirect('/notify/')

        specs = Specification(user_id=user_id, name=name, email=email, brand=brand, model=model, body_style=body_style, fuel=fuel, transmission=transmission, color=color, year=year, milage=milage, min_price=min_price, max_price=max_price)
        specs.save()
        messages.success(request, "Your filter is submitted and you'll be notified soon")

    return redirect('/notify/')





