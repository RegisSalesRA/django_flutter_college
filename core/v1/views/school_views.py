from rest_framework import generics
from core.v1.models.school_models import Discipline,Semester,Scores
from core.v1.serializers.serializers_school import DisciplineSerializer,SemesterSerializer,ScoresSerializer


class DisciplineListCreateView(generics.ListCreateAPIView):
    queryset = Discipline.objects.all()
    serializer_class = DisciplineSerializer 


class DisciplineRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Discipline.objects.all()
    serializer_class = DisciplineSerializer 

class SemesterListCreateView(generics.ListCreateAPIView):
    queryset = Semester.objects.all()
    serializer_class = SemesterSerializer 


class SemesterRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Semester.objects.all()
    serializer_class = SemesterSerializer 

class ScoresListCreateView(generics.ListCreateAPIView):
    queryset = Scores.objects.all()
    serializer_class = ScoresSerializer 


class ScoresRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Scores.objects.all()
    serializer_class = ScoresSerializer     