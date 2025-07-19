# In reports/admin.py

from django.contrib import admin
from .models import Report, Suspect, ReportSuspect, ReportVictim, ReportWitness

@admin.register(Report)
class ReportAdmin(admin.ModelAdmin):
    list_display = ('report_id', 'case_id', 'severity', 'status', 'officer_approve_username', 'reported_at')
    list_filter = ('severity', 'status', 'officer_approve_username__role_id__description', 'is_deleted')
    search_fields = ('case_location', 'description', 'reporter_fullname', 'reporter_phonenumber')
    date_hierarchy = 'reported_at'

@admin.register(Suspect)
class SuspectAdmin(admin.ModelAdmin):
    list_display = ('suspect_id', 'fullname', 'national', 'gender', 'dob', 'status')
    list_filter = ('national', 'gender', 'status', 'is_deleted')
    search_fields = ('fullname', 'identification', 'phonenumber')

@admin.register(ReportSuspect)
class ReportSuspectAdmin(admin.ModelAdmin):
    list_display = ('report_id', 'suspect_id', 'is_deleted')
    list_filter = ('is_deleted',)

@admin.register(ReportVictim)
class ReportVictimAdmin(admin.ModelAdmin):
    list_display = ('report_id', 'victim_id', 'is_deleted')
    list_filter = ('is_deleted',)

@admin.register(ReportWitness)
class ReportWitnessAdmin(admin.ModelAdmin):
    list_display = ('report_id', 'witness_id', 'is_deleted')
    list_filter = ('is_deleted',)
