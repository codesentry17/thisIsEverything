from django.contrib import admin
from .models import Specification

# Register your models here.

class NotifyAdmin(admin.ModelAdmin):
    list_display = ('user_id',)
    list_display_links = ('user_id',)
    search_fields = ('brand',)

admin.site.register(Specification, NotifyAdmin)
