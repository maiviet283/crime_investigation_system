from django.urls import path
from .initial_response import add_patrol_offical
from .initial_response import police_patrol_list
from .initial_response import information_protection
from . import views, view_two

app_name = 'reports'

urlpatterns = [
    path('report_wizard/', views.ReportWizardView.as_view(), name='report_wizard'),
    path('add-party/', views.add_party, name='add_party'),
    path('add-evidence/', views.add_evidence, name='add_evidence'),
    path('start_report_wizard/', views.start_report_wizard, name='start_report_wizard'),
    path('report_management/', views.report_management, name='report_management'),
    path('delete_party/<int:party_id>/', views.delete_party, name='delete_party'),
    path('delete_evidence/<int:evidence_id>/', views.delete_evidence, name='delete_evidence'),


    # 1 INITIAL RESPONSE
    # PAGES
    path('initial-response/', view_two.initial_response, name='initial-response'),
    path('initial-response/police-patrol-list/', police_patrol_list.police_patrol_list, name='police-patrol-list'),
    path('initial-response/create-information-protection/', information_protection.create_information_protection, name='create-information-protection'),
    path('initial-response/update-information-protection/<int:id>', information_protection.update_information_protection, name='update-information-protection'),
    # POST FORM
    path('initial-response/add-patrol-offical/', add_patrol_offical.assign_patrol_officer, name='add-patrol-offical'),
    path('initial-response/delete-information-protection/<int:id>', information_protection.delete_information_protection, name='delete-information-protection'),

    # 2 SCENE INFORMATION
    path('scene-info/', view_two.scene_information, name='scene-info'),

    # 3 Initial Investigation Report
    path('investigation-report/', view_two.investigation_report, name='investigation-report'),
]
