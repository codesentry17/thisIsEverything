from datetime import datetime
from django.shortcuts import render, get_object_or_404
from .models import Car
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

# Create your views here.

def car_detail(request, id):
    single_car = get_object_or_404(Car, pk=id)
    data = {
        'single_car': single_car,
    }
    return render(request, 'cars/car_detail.html', data)


def cars(request):
    cars = Car.objects.order_by('-created_date').filter(sold=False)
    paginator = Paginator(cars, 6)
    page = request.GET.get('page')
    paged_cars = paginator.get_page(page)

    brand_search = Car.objects.filter(sold=False).values_list('brand', flat=True).distinct()
    city_search = Car.objects.filter(sold=False).values_list('city', flat=True).distinct()
    color_search = Car.objects.filter(sold=False).values_list('color', flat=True).distinct()
    year_search = [x for x in range(2010,datetime.now().year)]
    body_style_search = ['sedan','hatchback','SUV']
    trans_search = ['automatic','manual']

    data = {
        'cars': paged_cars,
        'brand_search': sorted(brand_search),
        'city_search': sorted(city_search),
        'color_search': sorted(color_search),
        'year_search': year_search,
        'body_style_search': sorted(body_style_search),
        'trans_search': trans_search,
    }
    return render(request, 'cars/cars.html', data)


def search(request):
    cars = Car.objects.order_by('-created_date').filter(sold=False)

    if 'keyword' in request.GET:
        keyword = request.GET['keyword']
        if keyword:
            cars = cars.filter(car_title__icontains=keyword)

    if 'brand' in request.GET:
        brand = request.GET['brand']
        if brand:
            cars = cars.filter(brand__iexact=brand)

    if 'city' in request.GET:
        city = request.GET['city']
        if city:
            cars = cars.filter(city__iexact=city)

    if 'year' in request.GET:
        year = request.GET['year']
        if year:
            cars = cars.filter(year__iexact=year)

    if 'color' in request.GET:
        color = request.GET['color']
        if color:
            cars = cars.filter(color__iexact=color)

    if 'body_style' in request.GET:
        body_style = request.GET['body_style']
        if body_style:
            cars = cars.filter(body_style__iexact=body_style)
    
    if 'transmission' in request.GET:
        transmission = request.GET['transmission']
        if transmission:
            cars = cars.filter(transmission__iexact=transmission)

    if 'min_price' in request.GET:
        min_price = request.GET['min_price']
        max_price = request.GET['max_price']
        if max_price:
            cars = cars.filter(price__gte=min_price, price__lte=max_price)

    data = {
        'cars': cars,
    }
    return render(request, 'cars/search.html', data)

  