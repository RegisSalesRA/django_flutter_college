from rest_framework.views import APIView
from django.http import request
from rest_framework.response import Response
from rest_framework import generics, permissions, status
from rest_framework.permissions import IsAuthenticated

from core.models import Student
from  .serializer import (
    UserSerializer,
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
               "user": UserSerializer(
                    user, context=self.get_serializer_context()
                ).data,
               "message": "account created successfully",
            }
        )
    

class GetUser(APIView):
    permission_classes = [IsAuthenticated]
    def get(self, request):
        user = request.user
        content = {
            'user': str(user),
            'is_student': user.is_student,
            'is_teacher':user.is_teacher,
            'name': str(user.student.name),
            'phone': str(user.student.phone),
            'cpf': str(user.student.cpf),
        }
        return Response(content)