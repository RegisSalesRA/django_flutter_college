# Generated by Django 4.1.7 on 2023-03-26 20:12

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0011_remove_semester_discipline_remove_semester_year_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='discipline',
            name='semester',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='core.semester'),
            preserve_default=False,
        ),
    ]
