from django.db import models
from datetime import datetime

# Create your models here.

class Specification(models.Model):
    user_id = models.IntegerField()
    name = models.CharField(max_length=100)
    email = models.EmailField(max_length=100,blank=True)
    brand = models.CharField(max_length=100,blank=True)
    model = models.CharField(max_length=100,blank=True)
    body_style = models.CharField(max_length=100,blank=True)
    fuel = models.CharField(max_length=100,blank=True)
    transmission = models.CharField(max_length=100,blank=True)
    color = models.CharField(max_length=100,blank=True)
    year = models.IntegerField(blank=True)
    milage = models.IntegerField(blank=True)
    min_price = models.IntegerField(blank=True)
    max_price = models.IntegerField(blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    