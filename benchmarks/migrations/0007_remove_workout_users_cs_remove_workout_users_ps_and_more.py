# Generated by Django 4.0.2 on 2022-03-23 01:44

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('benchmarks', '0006_pastscore_remove_workout_users_workout_users_cs_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='workout',
            name='users_cs',
        ),
        migrations.RemoveField(
            model_name='workout',
            name='users_ps',
        ),
        migrations.AddField(
            model_name='workout',
            name='user',
            field=models.ManyToManyField(through='benchmarks.CurrentScore', to=settings.AUTH_USER_MODEL),
        ),
        migrations.DeleteModel(
            name='PastScore',
        ),
    ]
