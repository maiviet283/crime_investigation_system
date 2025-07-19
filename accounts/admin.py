from django.contrib import admin
from .models import Role, Permission, RolePermission, User

@admin.register(Role)
class RoleAdmin(admin.ModelAdmin):
    list_display = ('role_id', 'description', 'is_deleted')
    list_filter = ('is_deleted',)
    search_fields = ('description',)
    ordering = ('role_id',)

@admin.register(Permission)
class PermissionAdmin(admin.ModelAdmin):
    list_display = ('permission_id', 'description', 'is_deleted')
    list_filter = ('is_deleted',)
    search_fields = ('description',)
    ordering = ('permission_id',)

@admin.register(RolePermission)
class RolePermissionAdmin(admin.ModelAdmin):
    list_display = ('role_id', 'permission_id', 'is_deleted')
    list_filter = ('role_id', 'permission_id', 'is_deleted')
    search_fields = ('role_id__description', 'permission_id__description')
    ordering = ('role_id',)

@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = ('username', 'fullname', 'email', 'phonenumber', 'role_id', 'is_deleted')
    list_filter = ('role_id', 'is_deleted')
    search_fields = ('username', 'fullname', 'email', 'phonenumber')
    ordering = ('username',)
