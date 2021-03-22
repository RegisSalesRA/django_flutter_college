from typing import Generic
from django.db.models.fields import GenericIPAddressField
from django.shortcuts import render
from rest_framework.serializers import Serializer
from rest_framework import generics
from To_do_list.models import ToDoList
from To_do_list.serializers import ToDoListSerializers


class ListToDoList(generics.ListCreateAPIView):
    queryset = ToDoList.objects.all()
    serializer_class = ToDoListSerializers

class DetailToDoList(generics.RetrieveUpdateDestroyAPIView):
    queryset = ToDoList.objects.all()
    serializer_class = ToDoListSerializers