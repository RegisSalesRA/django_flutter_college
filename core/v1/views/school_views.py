from core.exceptions.exceptions import handle_error_response
from core.v1.permissions.permissions import TeacherUser
from rest_framework import generics
from core.v1.models.school_models import Discipline,Semester,Scores
from core.v1.serializers.serializers_school import ScoresPostSerializer, DisciplineSerializer,SemesterSerializer,ScoresSerializer
from rest_framework.permissions import IsAuthenticated

from rest_framework.response import Response


# Discpline
class DisciplineListCreateView(generics.ListCreateAPIView):
    serializer_class = DisciplineSerializer 
    
    def get_queryset(self):
            queryset = Discipline.objects.all()
            print(queryset)
            return queryset
       
           


class DisciplineRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Discipline.objects.all()
    serializer_class = DisciplineSerializer 

class DisciplineListByTeacher(generics.ListAPIView):
    serializer_class = DisciplineSerializer 
    permission_classes = [IsAuthenticated,TeacherUser]
    def get_queryset(self):
        user = self.request.user
        queryset = Discipline.objects.filter(teacher_id=user.teacher.id)
        return queryset


# Semester

class SemesterListCreateView(generics.ListCreateAPIView):
    queryset = Semester.objects.all()
    serializer_class = SemesterSerializer 


class SemesterRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Semester.objects.all()
    serializer_class = SemesterSerializer 


# Scores 

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