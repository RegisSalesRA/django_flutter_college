from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    is_teacher = models.BooleanField(default=False)
    is_student = models.BooleanField(default=False)
    createAt = models.DateTimeField(auto_now_add=True, auto_created=True)
    updateAt = models.DateTimeField(auto_now=True, auto_created=True)

    def __str__(self):
        return self.username


class Student(models.Model):
    user = models.OneToOneField(User, related_name="student", on_delete=models.CASCADE)
    name = models.CharField(max_length=255)
    phone = models.CharField(max_length=12, null=True, blank=True)

    def __str__(self):
        return self.user.username


class Teacher(models.Model):
    user = models.OneToOneField(User, related_name="teacher", on_delete=models.CASCADE)
    phone = models.CharField(max_length=12, null=True, blank=True)

    def __str__(self):
        return self.user.username
