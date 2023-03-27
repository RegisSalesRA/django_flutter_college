from rest_framework.views import APIView
from django.http import request
from rest_framework.response import Response
from rest_framework import generics, permissions, status
from rest_framework.permissions import IsAuthenticated
from core.v1.models.auth_models import Teacher
from core.v1.serializers.serializers_auth import (
    StudentSerializer,
    TeacherSerializer,
)

class StudentSignupView(generics.GenericAPIView):
    serializer_class = StudentSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        return Response(
            {
               "message": "account created successfully",
            }
        )
    
class TeacherSignupView(generics.GenericAPIView):
    serializer_class = TeacherSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        return Response(
            {
               "message": "account created successfully",
            }
        )
        

class GetUser(APIView):
    permission_classes = [IsAuthenticated]
    def get(self, request):
        user = request.user
        if hasattr(user, 'student'):
            content = {
            'id' : user.id,
            'user': str(user),
            'is_student': user.is_student,
            'is_teacher':user.is_teacher,
            'id_teacher' : user.student.id,
            'name': str(user.student.name),
            'phone': str(user.student.phone),
        }
        else:
            content = {
            'id' : user.id,    
            'user': str(user),
            'is_student': user.is_student,
            'is_teacher':user.is_teacher,
            'id_teacher' : user.teacher.id,
            'phone': str(user.teacher.phone),
        } 
        
        return Response(content)
    


class TeacherListCreateView(generics.ListCreateAPIView):
    serializer_class = TeacherSerializer 
    queryset = Teacher.objects.all()
    


