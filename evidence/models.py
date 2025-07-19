from django.db import models
from accounts.models import User
from django.utils import timezone

class Evidence(models.Model):
    evidence_id = models.AutoField(primary_key=True)
    measure_survey_id = models.ForeignKey('warrants.MeasureSurvey', on_delete=models.SET_NULL, null=True, db_column='measure_survey_id')
    warrant_result_id = models.ForeignKey('warrants.WarrantResult', on_delete=models.SET_NULL, null=True, db_column='warrant_result_id')
    report_id = models.ForeignKey('reports.Report', on_delete=models.SET_NULL, null=True, db_column='report_id')
    collector_username = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, db_column='collector_username')
    case_id = models.ForeignKey('cases.Case', on_delete=models.CASCADE, db_column='case_id', null=True)
    description = models.TextField(blank=True, null=True)
    evidence_type = models.CharField(max_length=100, blank=True, null=True)
    date_collected = models.DateTimeField(blank=True, null=True)
    status = models.CharField(max_length=50, blank=True, null=True)
    detailed_description = models.TextField(blank=True, null=True)
    initial_condition = models.TextField(blank=True, null=True)
    preservation_measures = models.TextField(blank=True, null=True)
    location_at_scene = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True, default=timezone.now)
    attached_file = models.TextField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'evidences'

class CaseEvidence(models.Model):
    case_id = models.ForeignKey('cases.Case', on_delete=models.CASCADE, db_column='case_id')
    evidence_id = models.ForeignKey(Evidence, on_delete=models.CASCADE, db_column='evidence_id')
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'case_evidences'
        unique_together = ('case_id', 'evidence_id')

class SuspectEvidence(models.Model):
    suspect_id = models.ForeignKey('reports.Suspect', on_delete=models.CASCADE, db_column='suspect_id')
    evidence_id = models.ForeignKey(Evidence, on_delete=models.CASCADE, db_column='evidence_id')
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'suspect_evidences'
        unique_together = ('suspect_id', 'evidence_id')

class RecordInfo(models.Model):
    record_info_id = models.AutoField(primary_key=True)
    evidence_id = models.ForeignKey(Evidence, on_delete=models.CASCADE, db_column='evidence_id', null=True)
    type_name = models.CharField(max_length=100, blank=True, null=True)
    source = models.TextField(blank=True, null=True)
    date_collected = models.DateField(blank=True, null=True)
    summary = models.TextField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'record_infos'