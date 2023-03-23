from django.db import models

from core.v1.models.auth_models import Student, Teacher

class Discipline(models.Model):
    name = models.CharField(max_length=100)
    teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE)
    def __str__(self):
        return self.name

class Grade(models.Model):
    aluno = models.ForeignKey(Student, on_delete=models.CASCADE)
    discipline = models.ForeignKey(Discipline, on_delete=models.CASCADE)
    value = models.DecimalField(max_digits=4, decimal_places=2)
    
    def __str__(self):
        return f"{self.aluno.user.username} - {self.disciplina.name} - {self.value}"