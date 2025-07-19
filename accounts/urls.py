from django.urls import path
from . import views_two
from .views_two import logout_and_home

app_name = 'accounts'
urlpatterns = [


    path('', views_two.home, name='home'),
    path('login/', views_two.login, name='login-two'),
    path('logout/', views_two.logout, name='logout'),
    path('logout_and_home/', logout_and_home, name='logout-and-home'),
    
]