
from django_forms.models import CadastroForm
from django_forms.serializers import CadastroFormSerializers
from django.shortcuts import render
from rest_framework import generics
from To_do_list.models import ToDoList
from To_do_list.serializers import ToDoListSerializers


class CadastroFormList(generics.ListCreateAPIView):
    queryset = CadastroForm.objects.all()
    serializer_class = CadastroFormSerializers

class DetailCadastroFormList(generics.RetrieveUpdateDestroyAPIView):
    queryset = CadastroForm.objects.all()
    serializer_class = CadastroFormSerializers