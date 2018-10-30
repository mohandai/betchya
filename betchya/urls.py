"""betchya URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from betchyaApp import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home, name='home'),
    path('login/', views.login, name='login'),
    path('register/', views.register, name='register'),
    path('logout/', views.logout, name='logout'),
    path('add_card/', views.add_card, name='add_card'),
    path('basketball/', views.basketball, name='basketball'),
    path('bet_history/', views.bet_history, name='bet_history'),
    path('bet_requests/', views.bet_requests, name='bet_requests'),
    path('confirm_bet/', views.confirm_bet, name='confirm_bet'),
    path('edit_detail/', views.edit_detail, name='edit_detail'),
    path('football/', views.football, name='football'),
    path('my_account/', views.my_account, name='my_account'),
    path('payment_detail/', views.payment_detail, name='payment_detail'),
    path('pending_bet/', views.pending_bet, name='pending_bet'),
    path('soccer/', views.soccer, name='soccer'),
    path('transfer_money/', views.transfer_money, name='transfer_money'),
]
