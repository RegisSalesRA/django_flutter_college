from rest_framework import status
from rest_framework.test import APIClient, APITestCase

from core.v1.mocks.api_routes_mock import ApiRouteMocks
from core.v1.mocks.data_mock import DataMocks
from core.v1.models.auth_models import Student, Teacher
from core.v1.models.college_models import Discipline, Scores, Semester
from core.v1.test.helpers.discipline_test_helpers import create_discipline, create_semester
from core.v1.test.helpers.users_test_helpers import create_student, create_teacher_and_get_token

client = APIClient()


class TestScoreInsertStudenteApi(APITestCase):
    def setUp(self):
        create_student(self)
        token = create_teacher_and_get_token(self)
        self.client.credentials(HTTP_AUTHORIZATION=f"Bearer {token}")

    def test_score_insert_student_api_success(self):
        teacher_instance = Teacher.objects.get(
            phone=DataMocks.data_teacher["phone"], name=DataMocks.data_teacher["name"]
        )
        create_semester(self, "semester_1")
        semester_instance = Semester.objects.get(id=1)
        student_instance = Student.objects.get(phone="12345678", name="userStudent")
        create_discipline(self, name="Geo", ano="2014", teacher=teacher_instance, semester=semester_instance)
        create_discipline(self, name="Matematica", ano="2017", teacher=teacher_instance, semester=semester_instance)
        discipline_instance = Discipline.objects.get(
            name="Geo", ano="2014", teacher=teacher_instance, semester=semester_instance
        )
        discipline_instance.student.add(student_instance.id)

        response = self.client.post(ApiRouteMocks().url_api_score_add_student, DataMocks.data_score, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data, {"success": "Score was inserted to student"})

    def test_score_insert_student_api_method_not_allowed(self):
        teacher_instance = Teacher.objects.get(
            phone=DataMocks.data_teacher["phone"], name=DataMocks.data_teacher["name"]
        )
        create_semester(self, "semester_1")
        semester_instance = Semester.objects.get(id=1)
        student_instance = Student.objects.get(phone="12345678", name="userStudent")
        create_discipline(self, name="Geo", ano="2014", teacher=teacher_instance, semester=semester_instance)
        create_discipline(self, name="Matematica", ano="2017", teacher=teacher_instance, semester=semester_instance)
        discipline_instance = Discipline.objects.get(
            name="Geo", ano="2014", teacher=teacher_instance, semester=semester_instance
        )
        discipline_instance.student.add(student_instance.id)
        query_score = Scores.objects.create(student=student_instance, discipline=discipline_instance, score=10)
        query_score.save()
        DataMocks.data_score

        response = self.client.put(ApiRouteMocks().url_api_score_add_student, DataMocks.data_score, format="json")

        self.assertEqual(response.status_code, status.HTTP_405_METHOD_NOT_ALLOWED)

    def test_score_insert_student_api_already_exists(self):
        teacher_instance = Teacher.objects.get(
            phone=DataMocks.data_teacher["phone"], name=DataMocks.data_teacher["name"]
        )
        create_semester(self, "semester_1")
        semester_instance = Semester.objects.get(id=1)
        student_instance = Student.objects.get(phone="12345678", name="userStudent")
        create_discipline(self, name="Geo", ano="2014", teacher=teacher_instance, semester=semester_instance)
        create_discipline(self, name="Matematica", ano="2017", teacher=teacher_instance, semester=semester_instance)
        discipline_instance = Discipline.objects.get(
            name="Geo", ano="2014", teacher=teacher_instance, semester=semester_instance
        )
        discipline_instance.student.add(student_instance.id)
        query_score = Scores.objects.create(student=student_instance, discipline=discipline_instance, score=10)
        query_score.save()
        DataMocks.data_score

        response = self.client.post(ApiRouteMocks().url_api_score_add_student, DataMocks.data_score, format="json")

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(response.data, {"error": "object alerady exists"})

    def test_score_insert_student_api_fail(self):
        teacher_instance = Teacher.objects.get(
            phone=DataMocks.data_teacher["phone"], name=DataMocks.data_teacher["name"]
        )
        create_semester(self, "semester_1")
        semester_instance = Semester.objects.get(id=1)
        student_instance = Student.objects.get(phone="12345678", name="userStudent")
        create_discipline(self, name="Geo", ano="2014", teacher=teacher_instance, semester=semester_instance)
        create_discipline(self, name="Matematica", ano="2017", teacher=teacher_instance, semester=semester_instance)
        discipline_instance = Discipline.objects.get(
            name="Geo", ano="2014", teacher=teacher_instance, semester=semester_instance
        )
        discipline_instance.student.add(student_instance.id)
        self.client.credentials(HTTP_AUTHORIZATION="Bearer invalid_token")
        response = self.client.post(ApiRouteMocks().url_api_score_add_student, DataMocks.data_score, format="json")

        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)
