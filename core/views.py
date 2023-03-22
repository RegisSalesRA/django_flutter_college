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
    def get(self, request, format=None):

        user = request.user
        value = Student.objects.get(user_id=user.id)

         
        print(value.user)
        content = {
            'user': str(request.user),
            'args': str(value)
        }
        return Response(content)