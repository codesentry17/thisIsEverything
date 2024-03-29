from django.contrib import admin
from .models import Specification

# Register your models here.

class NotifyAdmin(admin.ModelAdmin):
    list_display = ('id','user_id','name', 'created_date','brand','model','body_style','fuel','transmission','color','year','milage','min_price','max_price')
    list_display_links = ('user_id','name')
    search_fields = ('user_id','name')

    readonly_fields=[
        'user_id',
        'name', 
        'created_date',
        'brand',
        'model',
        'body_style',
        'fuel',
        'transmission',
        'color',
        'year',
        'milage',
        'min_price',
        'max_price',
    ]

admin.site.register(Specification, NotifyAdmin)
