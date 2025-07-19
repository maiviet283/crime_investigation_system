from django.contrib import admin
from .models import (
    InvestigationPlan, DigitalInvestResult, FinancialInvest,
    ForensicInvestResult, PhysicalInvestResult, Interview,
    Question, Witness, WitnessInterview, Victim, VictimInterview
)

@admin.register(InvestigationPlan)
class InvestigationPlanAdmin(admin.ModelAdmin):
    list_display = ('investigation_plan_id', 'accepted_officer_username', 'case_id', 'status', 'create_at')
    search_fields = ('accepted_officer_username__username', 'status', 'plan_content')
    list_filter = ('status', 'type', 'create_at','is_deleted')

@admin.register(DigitalInvestResult)
class DigitalInvestResultAdmin(admin.ModelAdmin):
    list_display = ('result_id', 'investigation_plan_id', 'device_type', 'created_at')
    search_fields = ('device_type', 'analyst_tool', 'result')
    list_filter = ('created_at',)

@admin.register(FinancialInvest)
class FinancialInvestAdmin(admin.ModelAdmin):
    list_display = ('evidence_id', 'summary')
    search_fields = ('summary',)

@admin.register(ForensicInvestResult)
class ForensicInvestResultAdmin(admin.ModelAdmin):
    list_display = ('result_id', 'investigation_plan_id', 'lab_name', 'received_at')
    search_fields = ('lab_name', 'report', 'result_summary')
    list_filter = ('received_at',)

@admin.register(PhysicalInvestResult)
class PhysicalInvestResultAdmin(admin.ModelAdmin):
    list_display = ('result_id', 'investigation_plan_id', 'summary', 'created_at')
    search_fields = ('summary',)
    list_filter = ('created_at',)

@admin.register(Interview)
class InterviewAdmin(admin.ModelAdmin):
    list_display = ('interview_id', 'investigation_plan_id', 'interviewer_id', 'start_time', 'end_time')
    search_fields = ('location',)
    list_filter = ('start_time',)

@admin.register(Question)
class QuestionAdmin(admin.ModelAdmin):
    list_display = ('question_id', 'interview_id', 'created_by', 'reliability')
    search_fields = ('content', 'answer')
    list_filter = ('reliability',)

@admin.register(Witness)
class WitnessAdmin(admin.ModelAdmin):
    list_display = ('witness_id', 'fullname', 'case_id', 'report_id')
    search_fields = ('fullname', 'statement')

@admin.register(WitnessInterview)
class WitnessInterviewAdmin(admin.ModelAdmin):
    list_display = ('witness_id', 'interview_id')

@admin.register(Victim)
class VictimAdmin(admin.ModelAdmin):
    list_display = ('victim_id', 'fullname', 'case_id', 'status')
    search_fields = ('fullname', 'injurie')
    list_filter = ('status',)

@admin.register(VictimInterview)
class VictimInterviewAdmin(admin.ModelAdmin):
    list_display = ('victim_id', 'interview_id')
