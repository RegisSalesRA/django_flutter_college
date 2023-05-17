from rest_framework import generics, status
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from core.exceptions.exceptions import except_error_response
from core.v1.models.auth_models import Student, Teacher
from core.v1.serializers.serializers_auth import (
    StudentSerializer,
    StudentSerializerRegister,
    TeacherSerializer,
    TeacherSerializerRegister,
)


class StudentSignupView(generics.GenericAPIView):
    """
    This view is responsible to login with student user by application mobile and web
    """

    serializer_class = StudentSerializerRegister

    def post(self, request):
        try:
            serializer = self.get_serializer(data=request.data)
            serializer.is_valid(raise_exception=True)
            serializer.save()
            return Response(
                {"result": "Student account created successfully", "status_code": status.HTTP_201_CREATED},
                status=status.HTTP_201_CREATED,
            )
        except Exception as err_fatal:
            return Response(except_error_response(err_fatal), status=status.HTTP_400_BAD_REQUEST)


class TeacherSignupView(generics.GenericAPIView):
    """
    This view is responsible to login with teacher user by application mobile and web
    """

    serializer_class = TeacherSerializerRegister

    def post(self, request):
        try:
            serializer = self.get_serializer(data=request.data)
            serializer.is_valid(raise_exception=True)
            serializer.save()
            return Response(
                {"result": "Teacher account created successfully", "status_code": status.HTTP_201_CREATED},
                status=status.HTTP_201_CREATED,
            )
        except Exception as err_fatal:
            return Response(except_error_response(err_fatal), status=status.HTTP_400_BAD_REQUEST)


class GetUser(APIView):
    """
    This view is responsible to create a teacher user and can list then too insert this on database
    """

    permission_classes = [IsAuthenticated]

    def get(self, request):
        user = request.user
        if hasattr(user, "student"):
            content = {
                "id": user.id,
                "user": str(user),
                "is_student": user.is_student,
                "is_teacher": user.is_teacher,
                "id_student": user.student.id,
                "name": str(user.student.name),
                "phone": str(user.student.phone),
            }
        else:
            content = {
                "id": user.id,
                "user": str(user),
                "is_student": user.is_student,
                "is_teacher": user.is_teacher,
                "name": str(user.teacher.name),
                "id_teacher": user.teacher.id,
                "phone": str(user.teacher.phone),
            }

        return Response(content)


class TeacherListCreateView(generics.ListCreateAPIView):
    """
    This view is responsible to create a teacher user and can list then too insert this on database
    """

    serializer_class = TeacherSerializer
    queryset = Teacher.objects.all()


class StudentListCreateView(generics.ListCreateAPIView):
    """
    This view is responsible to create a student user and can list then too insert this on database
    """

    serializer_class = StudentSerializer
    queryset = Student.objects.all()
