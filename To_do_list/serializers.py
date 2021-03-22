from django.db import models
from django.db.models import fields
from rest_framework import serializers;
from To_do_list.models import ToDoList

class ToDoListSerializers(serializers.ModelSerializer):
    class Meta:
        model = ToDoList
        fields = (
            'id','title','description'
        )