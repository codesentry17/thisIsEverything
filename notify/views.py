from datetime import datetime
from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Specification
from cars.models import Car
from django.shortcuts import get_object_or_404
from django.dispatch import receiver
from django.db.models.signals import post_save
from django.contrib.auth.decorators import login_required


from django.template.loader import render_to_string
from django.core.mail import EmailMessage

import threading

# Create your views here.

@login_required(login_url = 'login')
def filterForm(request):

    year = [x for x in range(2010,datetime.now().year)]

    data = {'years':year}
    return render(request,'notify/carForm.html',data)

def filterSubmit(request):
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

@login_required(login_url = 'login')
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

    filters['Year']=str(specs.year)+' onwards'
    filters['Mileage']=str(specs.milage)+' +'
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

@receiver(post_save, sender=Car)
def notifyUser(sender, instance, created,  *args, **kwargs):
    def execute_in_thread():
        # received one tuple from the Car model...
        specs = Specification.objects.filter(year__lte=instance.year, milage__lte=instance.milage, min_price__lte=instance.price, max_price__gte=instance.price)

        for s in specs:
            if s.brand:
                if s.brand.lower()!=instance.brand.lower():
                    continue
            if s.model:
                if s.model.lower() not in instance.car_title.lower():
                    continue
            if s.body_style:
                if s.body_style!=instance.body_style:
                    continue
            if s.fuel:
                if s.fuel!=instance.fuel_type:
                    continue
            if s.transmission:
                if s.transmission!=instance.transmission:
                    continue
            if s.color:
                if s.color!=instance.color:
                    continue
            
            print('\n\nCar Matched to a filter with ID',s.id,'\n\n')

            user = s.name
            subject = 'Found you your Car'
            data = {
                'user': user,
                'car': instance.car_title,
                'id': s.id,
            }
            message = render_to_string('emailTemplate.html',data)

            email = EmailMessage(subject, message, to=[s.email])
            email.content_subtype = 'html'
            email.send()

    thread = threading.Thread(target=execute_in_thread)
    thread.start()

    

        