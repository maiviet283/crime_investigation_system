from django.db import models
from django.utils import timezone
from accounts.models import User

class Case(models.Model):
    case_id = models.AutoField(primary_key=True)
    case_number = models.CharField(max_length=100, unique=True, blank=True, null=True)
    type_case = models.CharField(max_length=100, blank=True, null=True)
    severity = models.CharField(max_length=50, blank=True, null=True)
    status = models.CharField(max_length=50, blank=True, null=True)
    summary = models.TextField(blank=True, null=True)
    create_at = models.DateTimeField(blank=True, null=True, default=timezone.now)
    case_target = models.TextField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'cases'

    def __str__(self):
        return f"Case #{self.case_id} - {self.case_number or 'No Number'}"
    

class UserCase(models.Model):
    case_id = models.ForeignKey(Case, on_delete=models.CASCADE, db_column='case_id')
    officer_id = models.ForeignKey(User, on_delete=models.CASCADE, db_column='officer_id')
    responsible = models.BooleanField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'user_cases'
        unique_together = ('case_id', 'officer_id')

    def __str__(self):
        return f"UserCase (Case ID: {self.case_id_id}, Officer: {self.officer_id})"
    

class CaseResult(models.Model):
    case_result_id = models.AutoField(primary_key=True)
    case_id = models.ForeignKey(Case, on_delete=models.CASCADE, db_column='case_id', null=True)
    report_time = models.DateTimeField(blank=True, null=True)
    report_analyst = models.CharField(max_length=100, blank=True, null=True)
    summary = models.TextField(blank=True, null=True)
    identify_motive = models.TextField(blank=True, null=True)
    status = models.CharField(max_length=50, blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'case_results'

    def __str__(self):
        return f"CaseResult #{self.case_result_id} for Case #{self.case_id_id}"
    

class Sentence(models.Model):
    sentence_id = models.AutoField(primary_key=True)
    case_id = models.ForeignKey(Case, on_delete=models.CASCADE, db_column='case_id', null=True)
    case_result_id = models.ForeignKey(CaseResult, on_delete=models.CASCADE, db_column='case_result_id', null=True)
    sentence_type = models.CharField(max_length=100, blank=True, null=True)
    duration = models.CharField(max_length=100, blank=True, null=True)
    condition = models.TextField(blank=True, null=True)
    sentencing_date = models.DateField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'sentences'

    def __str__(self):
        return f"Sentence #{self.sentence_id} - {self.sentence_type or 'No Type'}"
    

class Inmate(models.Model):
    inmate_id = models.AutoField(primary_key=True)
    sentence_id = models.ForeignKey(Sentence, on_delete=models.CASCADE, db_column='sentence_id', null=True)
    fullname = models.CharField(max_length=100, blank=True, null=True)
    assigned_facility = models.TextField(blank=True, null=True)
    start_date = models.DateField(blank=True, null=True)
    expected_release = models.DateField(blank=True, null=True)
    health_status = models.TextField(blank=True, null=True)
    status = models.CharField(max_length=50, blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'inmates'

    def __str__(self):
        return f"Inmate #{self.inmate_id} - {self.fullname or 'Unnamed'}"
    

class Prosecution(models.Model):
    prosecution_id = models.AutoField(primary_key=True)
    case_id = models.ForeignKey(Case, on_delete=models.CASCADE, db_column='case_id', null=True)
    prosecutor_id = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, db_column='prosecutor_id')
    decision = models.TextField(blank=True, null=True)
    decision_date = models.DateField(blank=True, null=True)
    reasion = models.TextField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'prosecutions'

    def __str__(self):
        return f"Prosecution #{self.prosecution_id} for Case #{self.case_id_id}"
    

class ProsecutionSuspect(models.Model):
    prosecution_id = models.ForeignKey(Prosecution, on_delete=models.CASCADE, db_column='prosecution_id')
    suspect_id = models.ForeignKey('reports.Suspect', on_delete=models.CASCADE, db_column='suspect_id')
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'prosecution_suspects'
        unique_together = ('prosecution_id', 'suspect_id')

    def __str__(self):
        return f"ProsecutionSuspect: Prosecution {self.prosecution_id_id}, Suspect {self.suspect_id_id}"
    

class Indictment(models.Model):
    indictments_id = models.AutoField(primary_key=True)
    prosecution_id = models.ForeignKey(Prosecution, on_delete=models.CASCADE, db_column='prosecution_id', null=True)
    content = models.TextField(blank=True, null=True)
    issued_at = models.DateTimeField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'indictments'

    def __str__(self):
        return f"Indictment #{self.indictments_id}"
    

class Event(models.Model):
    event_id = models.AutoField(primary_key=True)
    suspect_id = models.ForeignKey('reports.Suspect', on_delete=models.CASCADE, db_column='suspect_id', null=True)
    case_id = models.ForeignKey(Case, on_delete=models.CASCADE, db_column='case_id', null=True)
    time_start = models.DateTimeField(blank=True, null=True)
    time_end = models.DateTimeField(blank=True, null=True)
    event_name = models.CharField(max_length=255, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    holiday_conflict = models.BooleanField(blank=True, null=True)
    holiday_id = models.ForeignKey('moderation.Holiday', on_delete=models.SET_NULL, null=True, db_column='holiday_id')
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'events'

    def __str__(self):
        return f"Event #{self.event_id} - {self.event_name or 'Unnamed'}"
    

class Timeline(models.Model):
    timeline_id = models.AutoField(primary_key=True)
    case_result_id = models.ForeignKey(CaseResult, on_delete=models.CASCADE, db_column='case_result_id', null=True)
    start_time = models.DateTimeField(blank=True, null=True)
    end_time = models.DateTimeField(blank=True, null=True)
    attached_file = models.TextField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    activity = models.TextField(blank=True, null=True)
    holiday_conflict = models.BooleanField(blank=True, null=True)
    holiday_id = models.ForeignKey('moderation.Holiday', on_delete=models.SET_NULL, null=True, db_column='holiday_id')
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'timelines'

    def __str__(self):
        return f"Timeline #{self.timeline_id} for CaseResult {self.case_result_id_id}"