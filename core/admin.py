from django.contrib import admin
from core.v1.models.auth_models import User, Teacher, Student
from core.v1.models.college_models import Discipline, Scores, Semester

# Auth Models
admin.site.register(User)
admin.site.register(Teacher)
admin.site.register(Student)

# College Models
admin.site.register(Discipline)
admin.site.register(Scores)
admin.site.register(Semester)