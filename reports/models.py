from django.db import models

from accounts.models import User

class Report(models.Model):
    SEVERITY_CHOICES = [
        ('URGENT', 'Urgent'),
        ('HIGH', 'High'),
        ('MEDIUM', 'Medium'),
        ('LOW', 'Low'),
    ]
    STATUS_CHOICES = [
        ('PENDING', 'Pending'),
        ('APPROVED', 'Approved'),
        ('REJECTED', 'Rejected'),
    ]
    report_id = models.AutoField(primary_key=True)
    case_id = models.ForeignKey('cases.Case', on_delete=models.CASCADE, db_column='case_id', null=True)
    type_report = models.CharField(max_length=100, blank=True, null=True)
    severity = models.CharField(max_length=220, choices=SEVERITY_CHOICES, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    case_location = models.TextField(blank=True, null=True)
    reported_at = models.DateTimeField(blank=True, null=True)
    reporter_fullname = models.CharField(max_length=100, blank=True, null=True)
    reporter_email = models.CharField(max_length=100, blank=True, null=True)
    reporter_phonenumber = models.CharField(max_length=20, blank=True, null=True)
    status = models.CharField(max_length=50, choices=STATUS_CHOICES, blank=True, null=True)
    officer_approve_username = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, db_column='officer_approve_username')
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'reports'

    def __str__(self):
        return f"Report #{self.report_id} - {self.case_location or 'No location'}"
    

class Suspect(models.Model):
    suspect_id = models.AutoField(primary_key=True)
    case_id = models.ForeignKey('cases.Case', on_delete=models.CASCADE, db_column='case_id', null=True)
    report_id = models.ForeignKey(Report, on_delete=models.CASCADE, db_column='report_id', null=True)
    suspect_role = models.CharField(max_length=50, blank=True, null=True)
    fullname = models.CharField(max_length=100, blank=True, null=True)
    national = models.CharField(max_length=50, blank=True, null=True)
    gender = models.CharField(max_length=10, blank=True, null=True)
    dob = models.DateField(blank=True, null=True)
    identification = models.CharField(max_length=50, blank=True, null=True)
    phonenumber = models.CharField(max_length=20, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    address = models.TextField(blank=True, null=True)
    catch_time = models.DateTimeField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    status = models.CharField(max_length=50, blank=True, null=True)
    mugshot_url = models.TextField(blank=True, null=True)
    fingerprints_hash = models.TextField(blank=True, null=True)
    health_status = models.TextField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'suspects'
    
    def __str__(self):
        return f"{self.fullname or 'Unnamed Suspect'} (ID: {self.suspect_id})"
    

class ReportSuspect(models.Model):
    report_id = models.ForeignKey(Report, on_delete=models.CASCADE, db_column='report_id')
    suspect_id = models.ForeignKey(Suspect, on_delete=models.CASCADE, db_column='suspect_id')
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'report_suspects'
        unique_together = ('report_id', 'suspect_id')

    def __str__(self):
        return f"Report #{self.report_id_id} - Suspect #{self.suspect_id_id}"
    

class ReportVictim(models.Model):
    report_id = models.ForeignKey(Report, on_delete=models.CASCADE, db_column='report_id')
    victim_id = models.ForeignKey('investigations.Victim', on_delete=models.CASCADE, db_column='victim_id')
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'report_victims'
        unique_together = ('report_id', 'victim_id')

    def __str__(self):
        return f"Report #{self.report_id_id} - Victim #{self.victim_id_id}"
    

class ReportWitness(models.Model):
    report_id = models.ForeignKey(Report, on_delete=models.CASCADE, db_column='report_id')
    witness_id = models.ForeignKey('investigations.Witness', on_delete=models.CASCADE, db_column='witness_id')
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'report_witnesses'
        unique_together = ('report_id', 'witness_id')

    def __str__(self):
        return f"Report #{self.report_id_id} - Witness #{self.witness_id_id}"