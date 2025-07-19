from django.db import models
from accounts.models import User

class Warrant(models.Model):
    warrant_id = models.AutoField(primary_key=True)
    case_id = models.ForeignKey('cases.Case', on_delete=models.CASCADE, db_column='case_id', null=True)
    warrant_name = models.CharField(max_length=255, blank=True, null=True)
    attached_file = models.TextField(blank=True, null=True)
    time_pulish = models.DateTimeField(blank=True, null=True)
    officer_username = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, db_column='officer_username')
    warrant_status = models.CharField(max_length=50, blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'warrants'

class WarrantResult(models.Model):
    warrant_result_id = models.AutoField(primary_key=True)
    warrant_id = models.ForeignKey(Warrant, on_delete=models.CASCADE, db_column='warrant_id', null=True)
    police_response = models.TextField(blank=True, null=True)
    location = models.TextField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    time_active = models.DateTimeField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'warrant_results'

class WarrantEvidence(models.Model):
    warrant_id = models.ForeignKey(Warrant, on_delete=models.CASCADE, db_column='warrant_id')
    evidence_id = models.ForeignKey('evidence.Evidence', on_delete=models.CASCADE, db_column='evidence_id')
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'warrant_evidences'
        unique_together = ('warrant_id', 'evidence_id')

class MeasureSurvey(models.Model):
    measure_survey_id = models.AutoField(primary_key=True)
    type_name = models.CharField(max_length=100, blank=True, null=True)
    source = models.TextField(blank=True, null=True)
    result = models.TextField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'measure_surveys'