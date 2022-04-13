# Generated by Django 4.0.2 on 2022-03-23 01:26

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('auth', '0012_alter_user_first_name_max_length'),
        ('benchmarks', '0003_delete_pastscore'),
    ]

    operations = [
        migrations.CreateModel(
            name='PastScore',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('past_score', models.CharField(max_length=64)),
                ('date', models.DateField()),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AlterField(
            model_name='workout',
            name='users',
            field=models.ManyToManyField(through='benchmarks.PastScore', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='pastscore',
            name='workout',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='benchmarks.workout'),
        ),
    ]