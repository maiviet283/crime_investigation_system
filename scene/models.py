from django.db import models

class SceneResponse(models.Model):
    scene_response_id = models.AutoField(primary_key=True)
    case_id = models.ForeignKey('cases.Case', on_delete=models.CASCADE, db_column='case_id', null=True)
    dispatch_time = models.DateTimeField(blank=True, null=True)
    arrival_time = models.DateTimeField(blank=True, null=True)
    preliminary_assessment = models.TextField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'scene_responses'

class MedicalSupport(models.Model):
    support_id = models.AutoField(primary_key=True)
    scene_response_id = models.ForeignKey(SceneResponse, on_delete=models.CASCADE, db_column='scene_response_id', null=True)
    unit_id = models.CharField(max_length=100, blank=True, null=True)
    type_of_support = models.CharField(max_length=100, blank=True, null=True)
    personnel_assigned = models.TextField(blank=True, null=True)
    location_assigned = models.TextField(blank=True, null=True)
    scene_sketch_url = models.TextField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'medical_supports'

class ScenePreservation(models.Model):
    preservation_id = models.AutoField(primary_key=True)
    scene_response_id = models.ForeignKey(SceneResponse, on_delete=models.CASCADE, db_column='scene_response_id', null=True)
    officer_name = models.CharField(max_length=100, blank=True, null=True)
    start_time = models.DateTimeField(blank=True, null=True)
    end_time = models.DateTimeField(blank=True, null=True)
    protection_methods = models.TextField(blank=True, null=True)
    area_covered = models.TextField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    attachment_url = models.TextField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'scene_preservations'

class SceneStatement(models.Model):
    statement_id = models.AutoField(primary_key=True)
    scene_response_id = models.ForeignKey(SceneResponse, on_delete=models.CASCADE, db_column='scene_response_id', null=True)
    provider_name = models.CharField(max_length=100, blank=True, null=True)
    statement_date = models.DateField(blank=True, null=True)
    contact_info = models.CharField(max_length=100, blank=True, null=True)
    role = models.CharField(max_length=50, blank=True, null=True)
    file_url = models.TextField(blank=True, null=True)
    statement_content = models.TextField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'scene_statements'

class SceneDescription(models.Model):
    description_id = models.AutoField(primary_key=True)
    scene_response_id = models.ForeignKey(SceneResponse, on_delete=models.CASCADE, db_column='scene_response_id', null=True)
    detail_description = models.TextField(blank=True, null=True)
    important_object_locations = models.TextField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'scene_descriptions'