# Generated by Django 3.0.7 on 2023-03-17 14:12

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('notify', '0002_specification_body_style'),
    ]

    operations = [
        migrations.AddField(
            model_name='specification',
            name='created_date',
            field=models.DateTimeField(blank=True, default=datetime.datetime.now),
        ),
    ]
