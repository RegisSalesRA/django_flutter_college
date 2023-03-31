from rest_framework.views import APIView
import json
from rest_framework.response import Response
from rest_framework import generics, permissions, status
from rest_framework.permissions import IsAuthenticated
from core.exceptions.exceptions import except_error_response
from core.v1.models.auth_models import Student, Teacher
from core.v1.serializers.serializers_auth import (
    StudentSerializer,
    StudentSerializerRegister,
    TeacherSerializerRegister,
    TeacherSerializerRegister,
    TeacherSerializer,
)

class StudentSignupView(generics.GenericAPIView):
    serializer_class = StudentSerializerRegister

    def post(self, request, *args, **kwargs):
        try: 
            serializer = self.get_serializer(data=request.data)
            serializer.is_valid(raise_exception=True)
            user = serializer.save()
            return Response({"result": "Student account created successfully","status_code":status.HTTP_201_CREATED},
            status=status.HTTP_201_CREATED,)
        except Exception as e:
            return Response(
               except_error_response(e),
               status=status.HTTP_400_BAD_REQUEST)
        
    
class TeacherSignupView(generics.GenericAPIView):
    serializer_class = TeacherSerializerRegister

    def post(self, request, *args, **kwargs):
        try:
            serializer = self.get_serializer(data=request.data)
            serializer.is_valid(raise_exception=True)
            user = serializer.save()
            return Response({"result": "Teacher account created successfully","status_code":status.HTTP_201_CREATED},
            status=status.HTTP_201_CREATED,)
        except Exception as e:
            return Response(except_error_response(e) ,status=status.HTTP_400_BAD_REQUEST)    
           

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
            'id_student' : user.student.id,
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
    
    
class StudentListCreateView(generics.ListCreateAPIView):
    serializer_class = StudentSerializer 
    queryset = Student.objects.all()
