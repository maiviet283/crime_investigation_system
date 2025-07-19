from django.db import models

class HolidayType(models.Model):
    holiday_type_id = models.AutoField(primary_key=True)
    type_name = models.CharField(max_length=100, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'holiday_types'

class Holiday(models.Model):
    holiday_id = models.AutoField(primary_key=True)
    holiday_name = models.CharField(max_length=255, blank=True, null=True)
    month = models.IntegerField(blank=True, null=True)
    week_of_month = models.IntegerField(blank=True, null=True)
    weekday_name = models.CharField(max_length=20, blank=True, null=True)
    fixed_date = models.DateField(blank=True, null=True)
    is_federal = models.BooleanField(blank=True, null=True)
    is_traditional = models.BooleanField(blank=True, null=True)
    holiday_type_id = models.ForeignKey(HolidayType, on_delete=models.CASCADE, db_column='holiday_type_id', null=True)
    description = models.TextField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'holidays'

class HolidayObservance(models.Model):
    observance_id = models.AutoField(primary_key=True)
    holiday_id = models.ForeignKey(Holiday, on_delete=models.CASCADE, db_column='holiday_id', null=True)
    applies_to = models.CharField(max_length=100, blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'holiday_observances'

class StateHoliday(models.Model):
    state_id = models.IntegerField()  # Không phải AutoField
    holiday = models.ForeignKey(Holiday, on_delete=models.CASCADE, db_column='holiday_id')
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'state_holidays'
        unique_together = ('state_id', 'holiday')  # tương đương PRIMARY KEY (state_id, holiday_id)
        indexes = [
            models.Index(fields=['holiday'], name='holiday_id')
        ]
