from datetime import datetime
from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.models import User
from django.shortcuts import render, get_object_or_404
from .models import Auction, aucContacts

from django.template.loader import render_to_string
from django.core.mail import EmailMessage
import threading

# Create your views here.

def aucInquiry(request):
    if request.method == 'POST':
        car_id = request.POST['car_id']
        car_title = request.POST['car_title']
        user_id = request.POST['user_id']
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        email = request.POST['email']
        phone = request.POST['phone']
        bid = str(request.POST['bid'])
        message = request.POST['message']
    
    if request.user.is_authenticated:
            user_id = request.user.id
            has_contacted = aucContacts.objects.all().filter(car_id=car_id, user_id=user_id)
            if has_contacted:
                messages.error(request, 'You have already made an inquiry about this car. Please wait until we get back to you.')
                return redirect('/auctions/'+car_id)

    contact = aucContacts(car_id=car_id, car_title=car_title, user_id=user_id,
        first_name=first_name, last_name=last_name, email=email, phone=phone, bid=bid, message=message)
    

    def execute_in_thread():
        admin_info = User.objects.get(is_superuser=True)
        admin_email = admin_info.email
        subject = 'New Car Bid'
        message = render_to_string('emailTemplate.html',{'mailType':3, 'car_title':car_title})
        eMail = EmailMessage(subject, message, to=[admin_email])
        eMail.content_subtype = 'html'
        eMail.send()
        
        subject = 'Thank you for placing your Bid'
        message = render_to_string('emailTemplate.html',{'mailType':4, 'car_title':car_title})
        eMail = EmailMessage(subject, message, to=[email])
        eMail.content_subtype = 'html'
        eMail.send()

    thread = threading.Thread(target=execute_in_thread)
    thread.start()
    
    contact.save()
    messages.success(request, 'Your bidding request has been submitted')
    return redirect('/auctions/'+car_id)

def auction(request):
    cars = Auction.objects.order_by('sell_date').filter(sell_date__gt=datetime.now().date())
    
    brand_search = Auction.objects.filter(sell_date__gt=datetime.now().date()).values_list('brand', flat=True).distinct()
    city_search = Auction.objects.filter(sell_date__gt=datetime.now().date()).values_list('city', flat=True).distinct()
    color_search = Auction.objects.filter(sell_date__gt=datetime.now().date()).values_list('color', flat=True).distinct()
    year_search = [x for x in range(2010,datetime.now().year)]
    body_style_search = ['SUV','sedan','hatchback']
    trans_search = ['automatic', 'manual']
    fuel_search = ['diesel', 'petrol', 'hybrid']

    
    data={
        'aucCars': cars,
        'brand_search': sorted(brand_search),
        'city_search': sorted(city_search),
        'year_search': year_search,
        'body_style_search': body_style_search,
        'color_search': sorted(color_search),
        'trans_search': trans_search,
        'fuel_search': fuel_search,
        'today':datetime.now().date(),
    }
    return render(request, 'auctions/auction.html',data)

def aucCarDetail(request, id):
    single_car = get_object_or_404(Auction, pk=id)

    data = {
        'single_car': single_car,
        'today': datetime.now().date(),
    }
    return render(request, 'auctions/aucCarDetail.html',data)
    

def aucSearch(request):
    cars = Auction.objects.order_by('sell_date').filter(sell_date__gt=datetime.now().date())
    print(cars.count(),'\n\n')
    filters = {}

    if 'keyword' in request.GET:
        keyword = request.GET['keyword']
        if keyword != '':
            filters['Keyword']=keyword
            cars = cars.filter(car_title__icontains=keyword)

    if 'brand' in request.GET:
        brand = request.GET['brand']
        if brand != '':
            filters['Brand']=brand
            cars = cars.filter(brand__iexact=brand)

    if 'city' in request.GET:
        city = request.GET['city']
        if city != '':
            filters['City']=city
            cars = cars.filter(city__iexact=city)

    if 'year' in request.GET:
        year = request.GET['year']
        if year != '':
            filters['Since Year']=year
            cars = cars.filter(year__gte=year)

    if 'color' in request.GET:
        color = request.GET['color']
        if color != '':
            filters['Color']=color
            cars = cars.filter(color__iexact=color)

    if 'body_style' in request.GET:
        body_style = request.GET['body_style']
        if body_style != '':
            filters['Body']=body_style
            cars = cars.filter(body_style__iexact=body_style)
    
    if 'transmission' in request.GET:
        transmission = request.GET['transmission']
        if transmission != '':
            filters['Transmission']=transmission
            cars = cars.filter(transmission__iexact=transmission)

    if 'fuel_search' in request.GET:
        fuel_type = request.GET['fuel_search']
        if fuel_type != '':
            filters['Fuel']=fuel_type
            cars = cars.filter(fuel_type__iexact=fuel_type)

    if ('min_price' or 'max_price') in request.GET:
        min_price = request.GET['min_price']
        max_price = request.GET['max_price']
        cars = cars.filter(price__gte=min_price,price__lte=max_price)
        filters['Minimum Bid Price']="Rs. "+min_price
        filters['Maximum Bid Price']="Rs. "+max_price


    data={
        'aucCars': cars,
        'filters': filters,
        'today':datetime.now().date(),
    }

    return render(request, 'auctions/aucSearch.html',data)

def delAucInq(request,id):
    contact = aucContacts.objects.get(id=id)
    carName = contact.car_title
    messages.success(request,'You have deleted your Auction Bid for {}'.format(carName))
    contact.delete()
    return redirect('dashboard')