from django.urls import path
from . import views

urlpatterns = [
    path('', views.filterForm, name='filterForm'),
    path('submit', views.filterSubmit, name='filterSubmit'),
]