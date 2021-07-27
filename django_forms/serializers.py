from django.db import models
from django.db.models import fields
from rest_framework import serializers;
from django_forms.models import CadastroForm, FastCadastro

class CadastroFormSerializers(serializers.ModelSerializer):
    class Meta:
        model = CadastroForm
        fields = (
            'id','image','nome', 'school','isCompleted'
        )


class FastCadastroserializers(serializers.ModelSerializer):
    class Meta:
        model = FastCadastro
        fields = (
            'id','nome', 'sobrenome'
        )