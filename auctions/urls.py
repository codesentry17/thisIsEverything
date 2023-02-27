from django.urls import path
from . import views

urlpatterns = [
    path('', views.auction, name='auction'),
    path('<int:id>', views.aucCarDetail, name='aucCarDetail'),
    path('aucInquiry',views.aucInquiry,name='aucInquiry'),
    path('search', views.aucSearch, name='aucSearch'),
    path('delete/<int:id>',views.delAucInq,name='delAucInq'),
]
 