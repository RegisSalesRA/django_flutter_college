from core.v1.permissions.permissions import TeacherUser
from rest_framework import generics
from core.v1.models.school_models import Discipline,Semester,Scores
from core.v1.serializers.serializers_school import ScoresPostSerializer, DisciplineSerializer,SemesterSerializer,ScoresSerializer
from rest_framework.permissions import IsAuthenticated

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

class ScoresListView(generics.ListAPIView):
    queryset = Scores.objects.all()
    serializer_class = ScoresSerializer 

class ScoresCreateView(generics.CreateAPIView):
    permission_classes = [IsAuthenticated,TeacherUser]
    queryset = Scores.objects.all()
    serializer_class = ScoresPostSerializer
 

class ScoresRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Scores.objects.all()
    serializer_class = ScoresSerializer     