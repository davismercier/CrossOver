# Generated by Django 4.0.2 on 2022-03-20 18:51

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('classes', '0004_remove_membership_expiration_date_membership_cost'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='membership',
            name='user',
        ),
    ]
