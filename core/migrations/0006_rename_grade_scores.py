# Generated by Django 4.1.7 on 2023-03-23 16:39

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("core", "0005_remove_semester_score_grade_score"),
    ]

    operations = [
        migrations.RenameModel(
            old_name="Grade",
            new_name="Scores",
        ),
    ]
