from django.urls import path
from . import views

urlpatterns = [
    path('filter',views.filterForm,name='filterForm')
]