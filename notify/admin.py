from django.contrib import admin
from .models import Specification

# Register your models here.

class NotifyAdmin(admin.ModelAdmin):
    list_display = ('user_id','name','brand','model','body_style','fuel','transmission','color','year','milage','min_price','max_price')
    list_display_links = ('user_id','name')
    search_fields = ('user_id','name')

admin.site.register(Specification, NotifyAdmin)
