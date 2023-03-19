from django.contrib import admin
from .models import Auction, aucContacts
from django.utils.html import format_html

# Register your models here.

class AuctionAdmin(admin.ModelAdmin):
    def thumbnail(self, object):
        return format_html('<img src="{}" width="40" style="border-radius: 50px;" />'.format(object.car_photo.url))
    
    thumbnail.short_description = 'Car Image'
    list_display = ('id','thumbnail','car_title', 'city', 'color', 'brand', 'year', 'body_style', 'fuel_type','sell_date',)
    list_display_links = ('id', 'thumbnail', 'car_title')
    list_editable = ['sell_date',]
    search_fields = ('id', 'car_title', 'city', 'brand', 'body_style','fuel_type')
    list_filter = ('city', 'brand', 'body_style', 'fuel_type')

admin.site.register(Auction, AuctionAdmin)  

class AuctionContact(admin.ModelAdmin):
    list_display = ('id', 'first_name', 'last_name', 'email', 'car_title', 'bid', 'create_date')
    list_display_links = ('id', 'first_name', 'last_name')
    search_fields = ('first_name', 'last_name', 'email', 'car_title')
    list_filter=('car_title',)
    list_per_page = 25

    readonly_fields=[
        'first_name',
        'last_name',
        'car_id',
        'car_title',
        'email',
        'phone',
        'bid',
        'message',
        'user_id',
        'create_date',]

admin.site.register(aucContacts, AuctionContact)