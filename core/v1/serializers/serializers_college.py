from rest_framework import serializers
from core.v1.models.college_models import Discipline,Semester,Scores
from core.v1.models.auth_models import Teacher



class DisciplineSerializer(serializers.ModelSerializer):
    class Meta:
        model = Discipline
        fields = "__all__"
        depth = 1

class SemesterSerializer(serializers.ModelSerializer):
    class Meta:
        model = Semester
        fields = "__all__"
        depth = 2

class ScoresSerializer(serializers.ModelSerializer):
    class Meta:
        model = Scores
        fields = "__all__"
        depth = 1


class ScoresPostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Scores
        fields = "__all__"

        