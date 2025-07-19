from django.contrib import admin
from .models import (
    Case, UserCase, CaseResult, Sentence, Inmate,
    Prosecution, ProsecutionSuspect, Indictment, Event, Timeline
)

@admin.register(Case)
class CaseAdmin(admin.ModelAdmin):
    list_display = ('case_id', 'case_number', 'type_case', 'severity', 'status', 'is_deleted')
    search_fields = ('case_number', 'summary')
    list_filter = ('type_case', 'status', 'is_deleted')

@admin.register(UserCase)
class UserCaseAdmin(admin.ModelAdmin):
    list_display = ('case_id', 'officer_id', 'responsible', 'is_deleted')
    search_fields = ('case_id__case_number', 'officer_id__username')

@admin.register(CaseResult)
class CaseResultAdmin(admin.ModelAdmin):
    list_display = ('case_result_id', 'case_id', 'report_time', 'report_analyst', 'status', 'is_deleted')
    search_fields = ('report_analyst', 'summary')

@admin.register(Sentence)
class SentenceAdmin(admin.ModelAdmin):
    list_display = ('sentence_id', 'case_id', 'sentence_type', 'duration', 'sentencing_date', 'is_deleted')

@admin.register(Inmate)
class InmateAdmin(admin.ModelAdmin):
    list_display = ('inmate_id', 'fullname', 'assigned_facility', 'start_date', 'expected_release', 'status', 'is_deleted')
    search_fields = ('fullname',)

@admin.register(Prosecution)
class ProsecutionAdmin(admin.ModelAdmin):
    list_display = ('prosecution_id', 'case_id', 'prosecutor_id', 'decision_date', 'is_deleted')
    search_fields = ('decision', 'reasion')

@admin.register(ProsecutionSuspect)
class ProsecutionSuspectAdmin(admin.ModelAdmin):
    list_display = ('prosecution_id', 'suspect_id', 'is_deleted')

@admin.register(Indictment)
class IndictmentAdmin(admin.ModelAdmin):
    list_display = ('indictments_id', 'prosecution_id', 'issued_at', 'is_deleted')

@admin.register(Event)
class EventAdmin(admin.ModelAdmin):
    list_display = ('event_id', 'event_name', 'case_id', 'time_start', 'holiday_conflict', 'is_deleted')

@admin.register(Timeline)
class TimelineAdmin(admin.ModelAdmin):
    list_display = ('timeline_id', 'case_result_id', 'start_time', 'end_time', 'holiday_conflict', 'is_deleted')