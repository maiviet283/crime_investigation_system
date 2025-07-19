import os
import django
import logging

logger = logging.getLogger(__name__)

"""
    This script is used to hash passwords for all users in the database.
    password_hash will be set to 'password123' for all users.
    Run this script with: python hash_passwords.py
"""
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'crime_management.settings')  # Change if project name is different
django.setup()

from django.contrib.auth.hashers import make_password
from accounts.models import User

def hash_all_passwords():
    """
    Hash passwords for all users in the database.
    Sets all user passwords to 'password123' for development/testing purposes.
    """
    try:
        common_password = 'password123'
        users = User.objects.filter(is_deleted=False)
        
        success_count = 0
        error_count = 0
        
        # Optimize: Use bulk operations instead of individual saves
        users_to_update = []
        for user in users:
            try:
                user.password_hash = make_password(common_password)
                users_to_update.append(user)
                success_count += 1
            except Exception as e:
                logger.error(f"Error preparing password hash for user {user.username}: {e}")
                print(f"Error preparing password hash for user {user.username}: {e}")
                error_count += 1
        
        # Bulk update all users at once
        if users_to_update:
            try:
                User.objects.bulk_update(users_to_update, ['password_hash'])
                print(f"Bulk updated passwords for {len(users_to_update)} users")
            except Exception as e:
                logger.error(f"Error in bulk password update: {e}")
                print(f"Error in bulk password update: {e}")
                # Fallback to individual saves if bulk update fails
                for user in users_to_update:
                    try:
                        user.save()
                        print(f"Password hashed for user: {user.username}")
                    except Exception as save_error:
                        logger.error(f"Error saving password for user {user.username}: {save_error}")
                        error_count += 1
                        success_count -= 1
        
        print(f"Password hashing completed. Success: {success_count}, Errors: {error_count}")
        
    except Exception as e:
        logger.error(f"Error in hash_all_passwords: {e}")
        print(f"Error in hash_all_passwords: {e}")
        raise

if __name__ == '__main__':
    hash_all_passwords()
