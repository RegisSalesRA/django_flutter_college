from django.db import models

# Create your models here.

class CadastroForm(models.Model):
    FRESHMAN = 'FR'
    JUNIOR = 'JR'
    SENIOR = 'SR'
    GRADUATE = 'GR'
    
    SCHOOL_CHOICES = [
        (FRESHMAN, 'Freshman'),
        (JUNIOR, 'Junior'),
        (SENIOR, 'Senior'),
        (GRADUATE, 'Graduate'),
    ]

    nome = models.CharField(max_length=100)
    image = models.ImageField(upload_to="fotosCamera/")
    school = models.CharField(max_length=2,choices=SCHOOL_CHOICES,default=FRESHMAN,)    
    isCompleted = models.BooleanField(default=False)


    def __repr__(self):
        return self.nome

    def __str__(self):
        return self.nome


class FastCadastro(models.Model):
    nome = models.CharField(max_length=100)
    sobrenome = models.CharField(max_length=100)
    isCompleted = models.BooleanField(default=False)
    image = models.ImageField(upload_to="fotosCamera/")

    def __repr__(self):
        return self.nome

    def __str__(self):
        return self.nome
