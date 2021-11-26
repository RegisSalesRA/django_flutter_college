from rest_framework import generics
from core.models import Cadastro, CadastroFoto
from core.v1.serializers import CadastroSerializers,CadastroFotoserializers


class CadastroView(generics.ListCreateAPIView):
    queryset = Cadastro.objects.all()
    serializer_class = CadastroSerializers

class CadastroDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Cadastro.objects.all()
    serializer_class = CadastroSerializers

class CadastroFotoView(generics.ListCreateAPIView):
    queryset = CadastroFoto.objects.all()
    serializer_class = CadastroFotoserializers 

class CadastroFotoDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = CadastroFoto.objects.all()
    serializer_class = CadastroFotoserializers 