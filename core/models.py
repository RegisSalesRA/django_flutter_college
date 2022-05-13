from django.db import models

class Cadastro(models.Model):
    JUNIOR = 'Junior'
    PLENO = 'Pleno'
    SENIOR = 'Senior' 
    
    DEV_CHOICES = [
        (JUNIOR, 'junior'),
        (PLENO, 'pleno'),
        (SENIOR, 'senior'),
    ]

    nome = models.CharField(max_length=100)
    dev = models.CharField(max_length=25,choices=DEV_CHOICES,default=JUNIOR)    
    isCompleted = models.BooleanField(default=False)


    def __repr__(self):
        return self.nome

    def __str__(self):
        return self.nome


class CadastroFoto(models.Model):
    nome = models.CharField(max_length=100)
    sobrenome = models.CharField(max_length=100)
    isCompleted = models.BooleanField(default=False)
    image = models.ImageField(upload_to="cadastroFotos/")

    def __repr__(self):
        return self.nome

    def __str__(self):
        return self.nome