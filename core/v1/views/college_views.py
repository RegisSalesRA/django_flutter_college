from rest_framework import generics, status
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from core.v1.models.auth_models import Student
from core.v1.models.college_models import Discipline, Scores, Semester
from core.v1.permissions.permissions import StudentUser, TeacherUser
from core.v1.serializers.serializers_college import (
    DisciplineSerializer,
    DisciplineSerializerPost,
    ScoresPostSerializer,
    ScoresSerializer,
    ScoresSerializerStudent,
    SemesterSerializer,
)


# Discpline
class DisciplineListView(generics.ListAPIView):
    """
    This view of code is responsible for bringing all the project disciplines registered in the database
    """

    queryset = Discipline.objects.all()
    serializer_class = DisciplineSerializer


class DisciplineCreateView(generics.CreateAPIView):
    """
    This view of code is responsible for create all the project disciplines in the database
    """

    queryset = Discipline.objects.all()
    serializer_class = DisciplineSerializerPost


class DisciplineRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    """
    This view of code is responsible for retrieve,update and destroy disciplines from database
    """

    queryset = Discipline.objects.all()
    serializer_class = DisciplineSerializer


class DisciplineListByTeacher(generics.ListAPIView):

    """
    This view of code is responsible list all disciplines by teacher
    if teacher login only his own discipline will be showed to him
    """

    serializer_class = DisciplineSerializer
    permission_classes = [IsAuthenticated, TeacherUser]

    def get_queryset(self):
        user = self.request.user
        queryset = Discipline.objects.filter(teacher_id=user.teacher.id)
        return queryset


class DisciplineListLeftStudent(generics.ListAPIView):

    """
    This view of code is responsible list all disciplines by teacher
    if teacher login only his own discipline will be showed to him
    """

    permission_classes = [IsAuthenticated, StudentUser]
    serializer_class = DisciplineSerializer

    def get_queryset(self):
        try:
            user = self.request.user
            current_student_discipline = user.student.discipline_set.all()
            queryset = Discipline.objects.exclude(id__in=current_student_discipline)
            if queryset is not None:
                return queryset
            return None

        except Exception as err_error:
            print(err_error)
            return str(err_error)


# Semester


class SemesterListCreateView(generics.ListCreateAPIView):
    """
    This view is responsible to list and create a new semester
    if semester is already created a map with error will be release
    """

    queryset = Semester.objects.all()
    serializer_class = SemesterSerializer

    def post(self, request, *args, **kwargs):
        dataValue = request.data["semester"]
        queryset = Semester.objects.filter(semester=dataValue)
        if queryset.exists():
            return Response({"error": "object already exist"}, status=status.HTTP_409_CONFLICT)
        else:
            self.create(request, *args, **kwargs)
            return Response({"success": "Semester created with success"}, status=status.HTTP_201_CREATED)


class SemesterRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):

    """
    This view is responsible to retrieve, destroy and update a semester
    """

    queryset = Semester.objects.all()
    serializer_class = SemesterSerializer


# Scores


class ScoresListView(generics.ListAPIView):
    """
    This view is responsible to list all scores from database
    """

    queryset = Scores.objects.all()
    serializer_class = ScoresSerializer


class ScoresCreateView(generics.CreateAPIView):
    """
    This view is responsible to create all scores from database
    """

    queryset = Scores.objects.all()
    serializer_class = ScoresPostSerializer


class ScoresRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):

    """
    This view is responsible to update,retrieve and destroy all scores from database
    """

    queryset = Scores.objects.all()
    serializer_class = ScoresSerializer


class DisciplinyByStudent(generics.ListAPIView):
    """
        This view of code is responsible list all disciplines by student
    if student login only his own discipline will be showed to him
    """

    serializer_class = DisciplineSerializer
    permission_classes = [IsAuthenticated, StudentUser]

    def get_queryset(self):
        user = self.request.user
        queryset = Discipline.objects.filter(student=user.student)
        return queryset


class InsertScoreToStudent(APIView):
    """
    This view is responsible to insert a score to student by discipline
    only teacher logged has access with this view and can excute this action
    """
    permission_classes = [IsAuthenticated, TeacherUser]

    def get(self):
        queryset = Scores.objects.all()
        serializers = ScoresSerializer(queryset, many=True)
        return Response(serializers.data)

    def post(self, request):
        try:
            id_student = request.data["id_student"]
            id_discpline = request.data["id_discpline"]
            nota = request.data["nota"]
            querset_student = Student.objects.get(id=id_student)
            queryset_discipline = Discipline.objects.get(id=id_discpline)
            query_score_filter = Scores.objects.filter(student=querset_student, discipline=queryset_discipline)

            if query_score_filter.exists():
                return Response({"error": "object alerady exists"}, status=status.HTTP_400_BAD_REQUEST)

            query_score = Scores.objects.create(student=querset_student, discipline=queryset_discipline, score=nota)
            query_score.save()
            return Response({"success": "Score was inserted to student"}, status=status.HTTP_201_CREATED)

        except Exception as err_error:
            print(err_error)
            return Response({"error": "object missing variables"}, status=status.HTTP_400_BAD_REQUEST)


class ChoseDisciplineByStudent(APIView):

    """
    This view is responsible to get and insert discipline to student by his choice
    only students logged has this permission if the discipline is already chosed will be not showed here
    """
    permission_classes = [IsAuthenticated, StudentUser]

    def post(self, request):
        user = request.user
        try:
            id_student = user.student.id
            id_discpline = request.data["id_discpline"]
            querset_student = Student.objects.get(id=id_student)
            queryset_discipline = Discipline.objects.get(id=id_discpline)

            if queryset_discipline.student.contains(querset_student):
                return Response({"error": "object alerady exists"}, status=status.HTTP_400_BAD_REQUEST)

            queryset_discipline.student.add(querset_student)
            return Response({"success": "Discipline was chosed"}, status=status.HTTP_200_OK)

        except Exception:
            return Response({"error": "object missing variables"}, status=status.HTTP_400_BAD_REQUEST)


class ScoreDisciplineByStudent(APIView):
    """"
    This view is responsible to get discipline from student with more detail response
    """
    permission_classes = [IsAuthenticated, StudentUser]

    def get(self, request):
        user = request.user
        queryset = Scores.objects.filter(student=user.student.id)

        serializers = ScoresSerializerStudent(queryset, many=True)
        return Response(serializers.data)
