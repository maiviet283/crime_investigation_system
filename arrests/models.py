from django.db import models
from accounts.models import User

class Arrest(models.Model):
    arrest_id = models.AutoField(primary_key=True)
    suspect_id = models.ForeignKey('reports.Suspect', on_delete=models.CASCADE, db_column='suspect_id', null=True)
    officer_id = models.ForeignKey(User, on_delete=models.CASCADE, db_column='officer_id', null=True)
    suspect_miranda_signature = models.TextField(blank=True, null=True)
    arrest_start_time = models.DateTimeField(blank=True, null=True)
    arrest_end_time = models.DateTimeField(blank=True, null=True)
    holiday_conflict = models.BooleanField(blank=True, null=True)
    holiday_id = models.ForeignKey('moderation.Holiday', on_delete=models.SET_NULL, null=True, db_column='holiday_id')
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'arrests'

class CaseArrest(models.Model):
    arrest_id = models.ForeignKey(Arrest, on_delete=models.CASCADE, db_column='arrest_id')
    case_id = models.ForeignKey('cases.Case', on_delete=models.CASCADE, db_column='case_id')
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'case_arrests'
        unique_together = ('arrest_id', 'case_id')
