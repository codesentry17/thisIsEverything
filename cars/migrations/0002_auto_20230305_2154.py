# Generated by Django 3.0.7 on 2023-03-05 16:24

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cars', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='car',
            old_name='model',
            new_name='brand',
        ),
    ]
