from django.db import models
from datetime import datetime
from django.utils.safestring import mark_safe

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
    created_date = models.DateField(default=datetime.now, blank=True)
    
    def textGeneration(self):
        text = ""
        if self.brand:
            text += "Brand: "+self.brand.capitalize()+"<br>"
        if self.model:
            text += "Model: "+self.model.capitalize()+"<br>"
        if self.body_style:
            text += "Body: "+self.body_style.capitalize()+"<br>"
        if self.fuel:
            text += "Fuel: "+self.fuel.capitalize()+"<br>"
        if self.transmission:
            text += "Transmission: "+self.transmission.capitalize()+"<br>"
        if self.color:
            text += "Body: "+self.color.capitalize()+"<br>"

        text += "Year: "+str(self.year)+" Onwards<br>"
        text += "Mileage: "+str(self.milage)+"+<br>"
        text += "Rs. "+str(self.min_price)+" << Price >> Rs. "+str(self.max_price)
        
        return mark_safe(text)

    