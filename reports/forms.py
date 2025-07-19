"""
reports/forms.py

This module defines Django forms for the crime report system, including reporter and incident forms.
"""

from django import forms

from .models import Report

class ReporterForm(forms.ModelForm):
    """
    Form for collecting reporter information in a crime report.
    Includes relationship type, name, email, and phone number.
    """
    RELATIONSHIP_CHOICES = [
        ('VICTIM', 'Victim'),
        ('WITNESS', 'Witness'),
        ('ANONYMOUS', 'Anonymous'),
    ]
    # Relationship field with radio select widget
    relationship = forms.ChoiceField(choices=RELATIONSHIP_CHOICES, widget=forms.RadioSelect)

    class Meta:
        model = Report
        fields = ['reporter_fullname', 'reporter_email', 'reporter_phonenumber']
        widgets = {
            # Full name input
            'reporter_fullname': forms.TextInput(attrs={'class': 'form-control', 'required': True}),
            # Email input with placeholder
            'reporter_email': forms.EmailInput(attrs={'class': 'form-control col-md-6', 'required': True, 'placeholder': 'example@example.com'}),
            # Phone number input
            'reporter_phonenumber': forms.TextInput(attrs={'class': 'form-control col-md-6', 'required': True}),
        }

class IncidentForm(forms.ModelForm):
    """
    Form for collecting incident details in a crime report.
    Includes type, severity, datetime, description, and location.
    """
    # Type of report (crime type)
    type_report = forms.ChoiceField(
        choices=[
            ('Theft', 'Theft'),
            ('Assault', 'Assault'),
            ('Fraud', 'Fraud'),
            ('Other', 'Other'),
        ],
        widget=forms.Select(attrs={'class': 'form-control', 'required': True})
    )
    # Severity of the incident
    severity = forms.ChoiceField(
        choices=[
            ('LOW', 'Low'),
            ('MEDIUM', 'Medium'),
            ('HIGH', 'High'),
            ('URGENT', 'Urgent'),
        ],
        widget=forms.Select(attrs={'class': 'form-control', 'required': True})
    )
    # Date and time of the incident
    reported_at = forms.DateTimeField(
        widget=forms.DateTimeInput(attrs={'type': 'datetime-local', 'class': 'form-control', 'required': True})
    )
    # Description of the incident
    description = forms.CharField(
        widget=forms.Textarea(attrs={'class': 'form-control', 'rows': 3, 'placeholder': 'Briefly describe what happened...'})
    )
    # Location of the incident (optional)
    case_location = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        required=False
    )

    class Meta:
        model = Report
        fields = ['type_report', 'severity', 'reported_at', 'description', 'case_location']

