from django import template
from datetime import datetime

register = template.Library()

@register.simple_tag
def status1(dictionary,key):
    # if sold == True
    if dictionary.get(key):
        return 'SOLD'
    else:
        return 'AVAILABLE'
    
@register.simple_tag
def status2(dictionary1,dictionary2,key):
    if dictionary1.get(key) or dictionary2.get(key)<datetime.now().date():
        return 'SOLD'
    else:
        return 'AVAILABLE'

    