# Generated by Django 3.2.15 on 2024-01-27 15:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app1', '0002_postmodel_baggage_number'),
    ]

    operations = [
        migrations.AddField(
            model_name='postmodel',
            name='chat_room_id',
            field=models.CharField(blank=True, max_length=5, null=True),
        ),
    ]