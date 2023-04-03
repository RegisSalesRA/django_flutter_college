from core.v1.models.auth_models import Student
from core.v1.permissions.permissions import StudentUser, TeacherUser
from rest_framework import generics , status
from core.v1.models.college_models import Discipline,Semester,Scores
from core.v1.serializers.serializers_college import DisciplineSerializerPost, ScoresPostSerializer, DisciplineSerializer,SemesterSerializer,ScoresSerializer
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework.response import Response

# Discpline
class DisciplineListView(generics.ListAPIView):
    queryset = Discipline.objects.all()
    serializer_class = DisciplineSerializer 

class DisciplineCreateView(generics.CreateAPIView):
    queryset = Discipline.objects.all()
    serializer_class = DisciplineSerializerPost    
    
       

class DisciplineRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Discipline.objects.all()
    serializer_class = DisciplineSerializer 

class DisciplineListByTeacher(generics.ListAPIView):
    serializer_class = DisciplineSerializer 
    permission_classes = [IsAuthenticated, TeacherUser]
    def get_queryset(self):
        user = self.request.user
        queryset = Discipline.objects.filter(teacher_id=user.teacher.id)
        return queryset

class DisciplineListLeftStudent(generics.ListAPIView):
    permission_classes = [IsAuthenticated, StudentUser]
    serializer_class = DisciplineSerializer 
    
    def get_queryset(self):
        try:
            user = self.request.user
            current_student_discipline = user.student.discipline_set.all()
            queryset = Discipline.objects.exclude(id__in=current_student_discipline)
            if queryset is not None:
                return queryset

        except Exception as e:
            str(e)
            print(e) 
            
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
    queryset = Scores.objects.all()
    serializer_class = ScoresPostSerializer
 

class ScoresRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Scores.objects.all()
    serializer_class = ScoresSerializer


class InsertScoreToStudent(APIView):

    permission_classes = [IsAuthenticated,TeacherUser]

    def get(self,request):
        queryset = Scores.objects.all()
        serializers = ScoresSerializer(queryset,many=True)
        return Response(serializers.data)
    
    def post(self,request):
        try:
            id_student = request.data['id_student']
            id_discpline = request.data['id_discpline']
            nota = request.data['nota']
            querset_student = Student.objects.get(id=id_student)
            queryset_discipline = Discipline.objects.get(id=id_discpline)
            query_score_filter = Scores.objects.filter(aluno=querset_student, discipline=queryset_discipline, score=nota)
            
            if query_score_filter.exists():
                return Response({"error":"object alerady exists"}, status=status.HTTP_400_BAD_REQUEST)    
            else: 
                query_score = Scores.objects.create(aluno=querset_student, discipline=queryset_discipline, score=nota)
                query_score.save() 
                return Response({"success":"create"}, status=status.HTTP_201_CREATED)
        except:
            return Response(
                {"error":"object missing variables"},
                status=status.HTTP_400_BAD_REQUEST)
        
        
class ChoseDisciplineByStudent(APIView):
    permission_classes = [IsAuthenticated,StudentUser]

    def post(self,request):
        user = request.user
        try:
            id_student = user.student.id
            id_discpline = request.data['id_discpline']
            querset_student = Student.objects.get(id=id_student)
            queryset_discipline = Discipline.objects.get(id=id_discpline)

            if (queryset_discipline.student.contains(querset_student)):
                return Response({"error":"object alerady exists"},status=status.HTTP_400_BAD_REQUEST)
            else:
                queryset_discipline.student.add(querset_student)
                return Response({"success":"create"},status=status.HTTP_200_OK)       
        
        except:
            return Response({"error":"object missing variables"},status=status.HTTP_400_BAD_REQUEST)
        

class DisciplinyByStudent(generics.ListAPIView):
    serializer_class = DisciplineSerializer 
    permission_classes = [IsAuthenticated, StudentUser]
    def get_queryset(self):
        user = self.request.user
        queryset = Discipline.objects.filter(student=user.student)
        return queryset  
