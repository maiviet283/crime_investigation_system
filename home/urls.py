from django.urls import path
from . import views

app_name = 'home'
urlpatterns = [
    path('', views.home_view, name='home'),
    path('reporter-form/', views.reporter_form_view, name='reporter_form'),
    path('incident-form/', views.incident_form_view, name='incident_form'),
    path('login/', views.login_view, name='login'),

]