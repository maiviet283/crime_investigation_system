from django.db import models
from django.utils import timezone

class Role(models.Model):
    role_id = models.AutoField(primary_key=True)
    description = models.TextField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'roles'

    def __str__(self):
        return self.description or f"Role #{self.pk}"
    

class Permission(models.Model):
    permission_id = models.AutoField(primary_key=True)
    description = models.TextField(blank=True, null=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'permissions'

    def __str__(self):
        return self.description or f"Permission #{self.pk}"
    

class RolePermission(models.Model):
    role_id = models.ForeignKey(Role, on_delete=models.CASCADE, db_column='role_id')
    permission_id = models.ForeignKey(Permission, on_delete=models.CASCADE, db_column='permission_id')
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'role_permissions'
        unique_together = ('role_id', 'permission_id')

    def __str__(self):
        return f"{self.role_id} → {self.permission_id}"

class User(models.Model):
    username = models.CharField(max_length=50, primary_key=True)
    password_hash = models.TextField(blank=True, null=True)
    fullname = models.CharField(max_length=100, blank=True, null=True)
    presentstatus = models.TextField(default='Idle')
    avatar_url = models.TextField(blank=True, null=True)
    email = models.CharField(max_length=100, blank=True, null=True)
    phonenumber = models.CharField(max_length=20, blank=True, null=True)
    zone = models.TextField(default='Sector 5, District 2')
    create_at = models.DateTimeField(default=timezone.now)
    role_id = models.ForeignKey(Role, on_delete=models.SET_NULL, null=True, db_column='role_id')
    is_deleted = models.BooleanField(default=False)

    class Meta:
        db_table = 'users'

    def __str__(self):
        return f"{self.fullname} ({self.username})"
