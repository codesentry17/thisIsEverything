from datetime import datetime
from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Specification
from cars.models import Car
from django.shortcuts import get_object_or_404
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

    return redirect('/accounts/dashboard')


def foundCar(request,id):

    "got the Specification row from id"
    specs = get_object_or_404(Specification,pk=id)

    cars = Car.objects.order_by('-created_date').filter(sold=False)
    
    filters={}
    if specs.brand:
        filters['Brand']=specs.brand.capitalize()
        cars = cars.filter(brand__icontains=specs.brand)
    if specs.model:
        filters['Model']=specs.model.capitalize()
        cars = cars.filter(car_title__icontains=specs.model)
    if specs.body_style:
        filters['Body']=specs.body_style.capitalize()
        cars = cars.filter(body_style__icontains=specs.body_style)
    if specs.fuel:
        filters['Fuel']=specs.fuel.capitalize()
        cars = cars.filter(fuel_type__icontains=specs.fuel)
    if specs.transmission:
        filters['Transmission']=specs.transmission.capitalize()
        cars = cars.filter(transmission__icontains=specs.transmission)
    if specs.color:
        filters['Color']=specs.color.capitalize()
        cars = cars.filter(color__icontains=specs.color)

    filters['Year']=specs.year
    filters['Mileage']=specs.milage
    filters['Min Price']=specs.min_price
    filters['Max Price']=specs.max_price

    "filtering cars that match the specification"










    data={
        'name': specs.name,
        'filter': filters,
        'cars': cars,
    }
    return render(request, 'notify/filtered_cars.html',data)


def deleteFilter(request, id):
    specification = Specification.objects.get(id = id)
    specification.delete()
    messages.success(request,'You have deleted your Car Filter')
    return redirect('dashboard')



