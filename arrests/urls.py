from django.urls import path
from . import views

app_name = 'arrests'
urlpatterns = [
    path('chief-report/', views.chief_report, name='chief-report')
]