from rest_framework import serializers
from core.models import Cadastro, CadastroFoto

class CadastroSerializers(serializers.ModelSerializer):
    class Meta:
        model = Cadastro
        fields = (
            'id','nome', 'dev','isCompleted'
        )


class CadastroFotoserializers(serializers.ModelSerializer):
    class Meta:
        model = CadastroFoto
        fields = (
            'id','nome', 'sobrenome' ,'isCompleted','image'
        )