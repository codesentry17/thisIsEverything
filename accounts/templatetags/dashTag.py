from django import template
from datetime import datetime

register = template.Library()

@register.simple_tag
def status1(dictionary,key):
    # if sold == True
    if dictionary.get(key)[0]:
        return 'SOLD'
    else:
        return 'AVAILABLE'

@register.simple_tag
def carPrice(dictionary,key):
    return dictionary.get(key)[1]
    

@register.simple_tag
def status2(dictionary,key):
    if dictionary.get(key)[0] or dictionary.get(key)[1]<datetime.now().date():
        return 'SOLD'
    else:
        return 'AVAILABLE'

@register.simple_tag
def aucMinBid(dictionary,key):
    return dictionary.get(key)[2]

