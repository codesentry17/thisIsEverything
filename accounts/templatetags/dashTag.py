from datetime import datetime
from django import template
from django.utils.safestring import mark_safe

register = template.Library()

@register.simple_tag
def status1(dictionary,key):
    # if sold == True
    if dictionary.get(key)[0]:
        return mark_safe("<td style='color:red; font-weight:bold;'>SOLD</td>")
    else:
        return mark_safe("<td style='color:green; font-weight:bold;'>AVAILABLE</td>")

@register.simple_tag
def carPrice(dictionary,key):
    return dictionary.get(key)[1]
    

@register.simple_tag
def status2(dictionary,key):
    if dictionary.get(key)[0]<=datetime.now().date():
        return mark_safe("<td style='color:red; font-weight:bold;'>SOLD</td>")    
    else:
        return mark_safe("<td style='color:green; font-weight:bold;'>AVAILABLE</td>")

@register.simple_tag
def aucMinBid(dictionary,key):
    return dictionary.get(key)[1]

