from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages, auth
from django.contrib.auth.models import User
from contacts.models import Contact
from cars.models import Car
from auctions.models import aucContacts, Auction
from notify.models import Specification
from django.contrib.auth.decorators import login_required

# Create your views here.

def login(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']

        user = auth.authenticate(username=username, password=password)

        if user is not None:
            auth.login(request, user)
            messages.success(request, 'You are now logged in.')

            # redirecting to previous page after logging in
            if 'next' in request.POST:
                return redirect(request.POST.get('next'))
            
            else:
                return redirect('dashboard')
        else:
            messages.error(request, 'Invalid login credentials')
            return redirect('login')
    return render(request, 'accounts/login.html')

def register(request):
    if request.method == 'POST':
        firstname = request.POST['firstname']
        lastname = request.POST['lastname']
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        confirm_password = request.POST['confirm_password']

        if password == confirm_password:
            if User.objects.filter(username=username).exists():
                messages.error(request, 'Username already exists!')
                return redirect('register')
            else:
                if User.objects.filter(email=email).exists():
                    messages.error(request, 'Email already exists!')
                    return redirect('register')
                else:
                    user = User.objects.create_user(first_name=firstname, last_name=lastname, email=email, username=username, password=password)
                    auth.login(request, user)
                    messages.success(request, 'You are now logged in.')
                    return redirect('dashboard')
                    user.save()
                    messages.success(request, 'You are registered successfully.')
                    return redirect('login')
        else:
            messages.error(request, 'Password do not match')
            return redirect('register')
    else:
        return render(request, 'accounts/register.html')


@login_required(login_url = 'login')
def dashboard(request):
    user_inquiry1 = Contact.objects.order_by('-create_date').filter(user_id=request.user.id)
    count1 = user_inquiry1.count()
    
    map1 = {}
    for x in user_inquiry1:
        map1[x.car_id] = [
            get_object_or_404(Car,pk =x.car_id).sold,
            get_object_or_404(Car,pk=x.car_id).price
        ]

    
    user_inquiry2 = aucContacts.objects.order_by('-create_date').filter(user_id=request.user.id)
    count2 = user_inquiry2.count()

    map2 = {}
    for x in user_inquiry2:
        map2[x.car_id] = [
            get_object_or_404(Auction,pk=x.car_id).sell_date,
            get_object_or_404(Auction, pk=x.car_id).price
        ]


    filters = Specification.objects.order_by('-created_date').filter(user_id=request.user.id)
    count3 = filters.count()
        

    data = {
        'inquiries1': user_inquiry1,
        'count1': count1,
        'map1': map1,

        'inquiries2': user_inquiry2,
        'count2': count2,
        'map2': map2,

        'filters': filters,
        'count3': count3,
        
    }
    return render(request, 'accounts/dashboard.html', data)

def logout(request):
    if request.method == 'POST':
        auth.logout(request)
        return redirect('home')
    return redirect('home')
