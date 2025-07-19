from django.db import models
from accounts.models import User
from django.utils import timezone


class InvestigationPlan(models.Model):
    investigation_plan_id = models.AutoField(primary_key=True)
    created_officer_username = models.ForeignKey(User, related_name='created_plans', on_delete=models.CASCADE, db_column='created_officer_username', null=True)
    accepted_officer_username = models.ForeignKey(User, related_name='accepted_plans', on_delete=models.SET_NULL, null=True, db_column='accepted_officer_username')
    case_id = models.ForeignKey('cases.Case', on_delete=models.CASCADE, db_column='case_id', null=True)
    deadline_date = models.DateField(blank=True, null=True)
    status = models.CharField(max_length=50, blank=True, null=True)
    create_at = models.DateTimeField(blank=True, null=True, default=timezone.now)
    plan_content = models.TextField(blank=True, null=True)
    type = models.CharField(max_length=50, blank=True, null=True)
    holiday_conflict = models.BooleanField(blank=True, null=True)
    holiday_id = models.ForeignKey('moderation.Holiday', on_delete=models.SET_NULL, null=True, db_column='holiday_id')
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'investigation_plans'

    def __str__(self):
        return f"InvestigationPlan #{self.investigation_plan_id}"
    

class DigitalInvestResult(models.Model):
    result_id = models.AutoField(primary_key=True)
    investigation_plan_id = models.ForeignKey(InvestigationPlan, on_delete=models.CASCADE, db_column='investigation_plan_id', null=True)
    evidence_id = models.ForeignKey('evidence.Evidence', on_delete=models.CASCADE, db_column='evidence_id', null=True)
    device_type = models.CharField(max_length=100, blank=True, null=True)
    analyst_tool = models.CharField(max_length=100, blank=True, null=True)
    result = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True, default=timezone.now)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'digital_invest_results'

    def __str__(self):
        return f"DigitalInvestResult #{self.result_id}"
    

class FinancialInvest(models.Model):
    evidence_id = models.ForeignKey('evidence.Evidence', on_delete=models.CASCADE, db_column='evidence_id', primary_key=True)
    summary = models.TextField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'financial_invests'

    def __str__(self):
        return f"FinancialInvest #{self.evidence_id_id}"
    

class ForensicInvestResult(models.Model):
    result_id = models.AutoField(primary_key=True)
    investigation_plan_id = models.ForeignKey(InvestigationPlan, on_delete=models.CASCADE, db_column='investigation_plan_id', null=True)
    evidence_id = models.ForeignKey('evidence.Evidence', on_delete=models.CASCADE, db_column='evidence_id', null=True)
    lab_name = models.CharField(max_length=100, blank=True, null=True)
    report = models.TextField(blank=True, null=True)
    result_summary = models.TextField(blank=True, null=True)
    received_at = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True, default=timezone.now)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'forensic_invest_results'

    def __str__(self):
        return f"ForensicInvestResult #{self.result_id}"
    

class PhysicalInvestResult(models.Model):
    result_id = models.AutoField(primary_key=True)
    investigation_plan_id = models.ForeignKey(InvestigationPlan, on_delete=models.CASCADE, db_column='investigation_plan_id', null=True)
    summary = models.TextField(blank=True, null=True)
    evidence_id = models.ForeignKey('evidence.Evidence', on_delete=models.CASCADE, db_column='evidence_id', null=True)
    attached_file = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True, default=timezone.now)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'physical_invest_results'

    def __str__(self):
        return f"PhysicalInvestResult #{self.result_id}"
    

class Interview(models.Model):
    interview_id = models.AutoField(primary_key=True)
    investigation_plan_id = models.ForeignKey(InvestigationPlan, on_delete=models.CASCADE, db_column='investigation_plan_id', null=True)
    interviewer_id = models.ForeignKey(User, on_delete=models.CASCADE, db_column='interviewer_id', null=True)
    location = models.TextField(blank=True, null=True)
    attached_file = models.TextField(blank=True, null=True)
    start_time = models.DateTimeField(blank=True, null=True)
    end_time = models.DateTimeField(blank=True, null=True)
    holiday_conflict = models.BooleanField(blank=True, null=True)
    holiday_id = models.ForeignKey('moderation.Holiday', on_delete=models.SET_NULL, null=True, db_column='holiday_id')
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'interviews'

    def __str__(self):
        return f"Interview #{self.interview_id}"
    

class Question(models.Model):
    question_id = models.AutoField(primary_key=True)
    interview_id = models.ForeignKey(Interview, on_delete=models.CASCADE, db_column='interview_id', null=True)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE, db_column='created_by', null=True)
    content = models.TextField(blank=True, null=True)
    answer = models.TextField(blank=True, null=True)
    reliability = models.CharField(max_length=100, blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'questions'

    def __str__(self):
        return f"Question #{self.question_id} - {self.content[:30]}"
    

class Witness(models.Model):
    witness_id = models.AutoField(primary_key=True)
    case_id = models.ForeignKey('cases.Case', on_delete=models.CASCADE, db_column='case_id', null=True)
    report_id = models.ForeignKey('reports.Report', on_delete=models.CASCADE, db_column='report_id', null=True)
    fullname = models.CharField(max_length=100, blank=True, null=True)
    contact = models.CharField(max_length=100, blank=True, null=True)
    statement = models.TextField(blank=True, null=True)

    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'witnesses'

    def __str__(self):
        return f"Witness #{self.witness_id} - {self.fullname}"
    

class WitnessInterview(models.Model):
    witness_id = models.ForeignKey(Witness, on_delete=models.CASCADE, db_column='witness_id')
    interview_id = models.ForeignKey(Interview, on_delete=models.CASCADE, db_column='interview_id')
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'witness_interviews'
        unique_together = ('witness_id', 'interview_id')
    
    def __str__(self):
        return f"WitnessInterview: Witness #{self.witness_id_id} ↔ Interview #{self.interview_id_id}"



class Victim(models.Model):
    victim_id = models.AutoField(primary_key=True)
    case_id = models.ForeignKey('cases.Case', on_delete=models.CASCADE, db_column='case_id', null=True)
    report_id = models.ForeignKey('reports.Report', on_delete=models.CASCADE, db_column='report_id', null=True)
    fullname = models.CharField(max_length=100, blank=True, null=True)
    contact = models.CharField(max_length=100, blank=True, null=True)
    injurie = models.TextField(blank=True, null=True)
    status = models.CharField(max_length=50, blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'victims'

    def __str__(self):
        return f"Victim #{self.victim_id} - {self.fullname}"
    

class VictimInterview(models.Model):
    victim_id = models.ForeignKey(Victim, on_delete=models.CASCADE, db_column='victim_id')
    interview_id = models.ForeignKey(Interview, on_delete=models.CASCADE, db_column='interview_id')
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'victim_interviews'
        unique_together = ('victim_id', 'interview_id')

    def __str__(self):
        return f"VictimInterview: Victim #{self.victim_id_id} ↔ Interview #{self.interview_id_id}"