from django.db import models
from core.v1.models.auth_models import Student, Teacher

    
class Semester(models.Model):
    SEMESTER_DICT = (
        ('semester_1', 'Semester 1'),
        ('semester_2', 'Semester 2'),
        ('semester_3', 'Semester 3'),
        ('semester_4', 'Semester 4'),  
    )
    semester =  models.CharField(max_length=10, choices=SEMESTER_DICT)

    createAt = models.DateTimeField(auto_now_add=True, auto_created=True)
    updateAt = models.DateTimeField(auto_now=True, auto_created=True)

    def __str__(self):
        return self.semester


class Discipline(models.Model):
    name = models.CharField(max_length=100)
    ano = models.CharField(max_length=4)
    student = models.ManyToManyField(Student)
    teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE)
    semester = models.ForeignKey(Semester, on_delete=models.CASCADE)

    createAt = models.DateTimeField(auto_now_add=True, auto_created=True)
    updateAt = models.DateTimeField(auto_now=True, auto_created=True)    
    
    def __str__(self):
        return self.name
    
class Scores(models.Model):
    aluno = models.ForeignKey(Student, on_delete=models.CASCADE)
    discipline = models.ForeignKey(Discipline, on_delete=models.CASCADE)
    semester = models.ForeignKey(Semester, on_delete=models.CASCADE)
    score = models.DecimalField(max_digits=4, decimal_places=2)

    createAt = models.DateTimeField(auto_now_add=True, auto_created=True)
    updateAt = models.DateTimeField(auto_now=True, auto_created=True)
    class Meta:
        verbose_name = 'Score'
        verbose_name_plural = 'Scores'
        
    def __str__(self):
        return f"{self.aluno.user.username} - {self.discipline.name}"