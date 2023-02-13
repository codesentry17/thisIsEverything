from django.urls import path
from . import views

urlpatterns = [
    path('', views.auction, name='auction'),
    path('<int:id>', views.aucCarDetail, name='aucCarDetail'),
    path('aucInquiry',views.aucInquiry,name='aucInquiry')
]
 