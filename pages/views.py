from datetime import datetime
from django.shortcuts import render, redirect
from .models import Team
from cars.models import Car
from django.contrib.auth.models import User
from django.core.mail import send_mail
from django.contrib import messages
from django.core.paginator import Paginator

# Create your views here.

def home(request):
    teams = Team.objects.all()

    """Starting the paginating Shit"""

    featured_cars = Car.objects.order_by('-created_date').filter(sold=False,is_featured=True)

    all_cars = Car.objects.order_by('-created_date').filter(sold=False)
    paginator = Paginator(all_cars,6)
    page = request.GET.get('page')
    all_cars = paginator.get_page(page)


    brand_search = Car.objects.filter(sold=False).values_list('brand', flat=True).distinct()
    city_search = Car.objects.filter(sold=False).values_list('city', flat=True).distinct()
    year_search = [x for x in range(2010,datetime.now().year)]
    body_style_search = ['sedan','hatchback','SUV']
    data = {
        'teams': teams,
        'featured_cars': featured_cars,
        'all_cars': all_cars,
        'brand_search': sorted(brand_search),
        'city_search': sorted(city_search),
        'year_search': year_search,
        'body_style_search': body_style_search,
    }
    return render(request, 'pages/home.html', data)


def about(request):
    teams = Team.objects.all()
    data = {
        'teams': teams,
    }
    return render(request, 'pages/about.html', data)

def services(request):
    return render(request, 'pages/services.html')

def contact(request):
    if request.method == 'POST':
        name = request.POST['name']
        email = request.POST['email']
        subject = request.POST['subject']
        phone = request.POST['phone']
        message = request.POST['message']

        email_subject = 'You have a new message from Carzone website regarding ' + subject
        message_body = 'Name: ' + name + '. Email: ' + email + '. Phone: ' + phone + '. Message: ' + message

        admin_info = User.objects.get(is_superuser=True)
        admin_email = admin_info.email
        send_mail(
                email_subject,
                message_body,
                '',
                [admin_email],
                fail_silently=False,
            )
        messages.success(request, 'Thank you for contacting us. We will get back to you shortly')
        return redirect('contact')

    return render(request, 'pages/contact.html')



