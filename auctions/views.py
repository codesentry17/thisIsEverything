from django.shortcuts import render, redirect
from django.core.mail import send_mail
from django.contrib import messages
from django.contrib.auth.models import User
from django.shortcuts import render, get_object_or_404
from .models import Auction, aucContacts

# Create your views here.

def auction(request):
    cars = Auction.objects.order_by('-created_date')
    data={
        'aucCars': cars,
    }
    return render(request, 'auctions/auction.html',data)

def aucCarDetail(request, id):
    single_car = get_object_or_404(Auction, pk=id)

    data = {
        'single_car': single_car,
    }
    return render(request, 'auctions/aucCarDetail.html',data)


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
    
    admin_info = User.objects.get(is_superuser=True)
    
    send_mail(
            'New Car Bid',  #title
            'You have a new bidding for the car ' + car_title + '. Please login to your admin panel for more info.',    #subject
            '', #from (fixed in settings)
            ['1010throwaway0101@gmail.com'],    #to
            fail_silently=False,
            )
    
    contact.save()
    messages.success(request, 'Your bidding request has been submitted')
    return redirect('/auctions/'+car_id)
    