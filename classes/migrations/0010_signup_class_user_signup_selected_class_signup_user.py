# Generated by Django 4.0.2 on 2022-03-25 09:53

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('classes', '0009_alter_membership_description'),
    ]

    operations = [
        migrations.CreateModel(
            name='SignUp',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField()),
            ],
        ),
        migrations.AddField(
            model_name='class',
            name='user',
            field=models.ManyToManyField(through='classes.SignUp', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='signup',
            name='selected_class',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='classes.class'),
        ),
        migrations.AddField(
            model_name='signup',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]