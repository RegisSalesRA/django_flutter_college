# Generated by Django 4.2 on 2023-04-24 13:19

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("core", "0015_alter_discipline_student"),
    ]

    operations = [
        migrations.AddField(
            model_name="teacher",
            name="name",
            field=models.CharField(default="randon name", max_length=255),
            preserve_default=False,
        ),
    ]