from rest_framework import status
from rest_framework.test import APIClient, APITestCase

from core.v1.mocks.api_routes_mock import ApiRouteMocks
from core.v1.mocks.data_mock import DataMocks
from core.v1.models.auth_models import Student, Teacher
from core.v1.models.college_models import Discipline, Semester
from core.v1.test.helpers.discipline_test_helpers import create_discipline, create_score, create_semester
from core.v1.test.helpers.users_test_helpers import (
    create_student,
    create_student_and_get_token,
    create_teacher,
    create_teacher_and_get_token,
)

client = APIClient()


class TestDisciplineLeftByStudentApi(APITestCase):
    def setUp(self):
        token = create_student_and_get_token(self)
        self.client.credentials(HTTP_AUTHORIZATION=f"Bearer {token}")

    def test_get_discpline_left_by_sudent_success(self):
        create_teacher(self)
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

        response = self.client.get(ApiRouteMocks().url_api_discipline_left_student)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)

    def test_get_discpline_left_by_sudent_fail(self):
        self.client.credentials(HTTP_AUTHORIZATION="Bearer invalid_token")
        response = self.client.get(ApiRouteMocks().url_api_discipline_left_student)
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)
        self.assertEqual(response.data["detail"], "Given token not valid for any token type")


class TestDisciplineByStudentApi(APITestCase):
    def setUp(self):
        token = create_student_and_get_token(self)
        self.client.credentials(HTTP_AUTHORIZATION=f"Bearer {token}")

    def test_discipline_by_student_success(self):
        create_teacher(self)
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

        response = self.client.get(ApiRouteMocks().url_api_discipline_student)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_discipline_by_student_fail(self):
        create_teacher(self)
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

        response = self.client.get(ApiRouteMocks().url_api_discipline_student)

        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_discipline_by_student_fail_forbidden(self):
        create_teacher(self)
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

        response = self.client.get(ApiRouteMocks().url_api_discipline_teacher)

        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)


class TestDisciplineByTeacherApi(APITestCase):
    def setUp(self):
        token = create_teacher_and_get_token(self)
        create_student(self)
        self.client.credentials(HTTP_AUTHORIZATION=f"Bearer {token}")

    def test_discipline_by_teacher_success(self):
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

        response = self.client.get(ApiRouteMocks().url_api_discipline_teacher)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_discipline_by_teacher_fail(self):
        create_teacher(self)
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

        response = self.client.get(ApiRouteMocks().url_api_discipline_teacher)

        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_discipline_by_teacher_fail_forbidden(self):
        create_teacher(self)

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

        response = self.client.get(ApiRouteMocks().url_api_discipline_student)

        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)


class TestDisciplineChoseByStudent(APITestCase):
    def setUp(self):
        token = create_student_and_get_token(self)
        self.client.credentials(HTTP_AUTHORIZATION=f"Bearer {token}")

    def test_discipline_chose_by_student_success(self):
        create_teacher(self)
        teacher_instance = Teacher.objects.get(
            phone=DataMocks.data_teacher["phone"], name=DataMocks.data_teacher["name"]
        )
        create_semester(self, "semester_1")
        semester_instance = Semester.objects.get(id=1)
        create_discipline(self, name="Geo", ano="2014", teacher=teacher_instance, semester=semester_instance)
        create_discipline(self, name="Matematica", ano="2017", teacher=teacher_instance, semester=semester_instance)

        response = self.client.post(
            ApiRouteMocks().url_api_discipline_chose_by_student, DataMocks.data_discipline_choose, format="json"
        )

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data, {"success": "create"})

    def test_discipline_chose_by_student_already_created_fail(self):
        student_instance = Student.objects.get(phone="12345678", name="userStudent")
        create_teacher(self)
        teacher_instance = Teacher.objects.get(
            phone=DataMocks.data_teacher["phone"], name=DataMocks.data_teacher["name"]
        )
        create_semester(self, "semester_1")
        semester_instance = Semester.objects.get(id=1)
        create_discipline(self, name="Geo", ano="2014", teacher=teacher_instance, semester=semester_instance)
        create_discipline(self, name="Matematica", ano="2017", teacher=teacher_instance, semester=semester_instance)
        discipline_instance = Discipline.objects.get(
            name="Geo", ano="2014", teacher=teacher_instance, semester=semester_instance
        )
        discipline_instance.student.add(student_instance.id)

        response = self.client.post(
            ApiRouteMocks().url_api_discipline_chose_by_student, DataMocks.data_discipline_choose, format="json"
        )

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(response.data, {"error": "object alerady exists"})

    def test_discipline_chose_by_student_fail_unauthorized(self):
        create_teacher(self)
        teacher_instance = Teacher.objects.get(
            phone=DataMocks.data_teacher["phone"], name=DataMocks.data_teacher["name"]
        )
        create_semester(self, "semester_1")
        semester_instance = Semester.objects.get(id=1)
        create_discipline(self, name="Geo", ano="2014", teacher=teacher_instance, semester=semester_instance)
        create_discipline(self, name="Matematica", ano="2017", teacher=teacher_instance, semester=semester_instance)
        self.client.credentials(HTTP_AUTHORIZATION="Bearer invalid_token")

        response = self.client.post(
            ApiRouteMocks().url_api_discipline_chose_by_student, DataMocks.data_discipline_choose, format="json"
        )
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_discipline_chose_by_student_fail_methodo_not_allowed(self):
        response = self.client.get(
            ApiRouteMocks().url_api_discipline_chose_by_student, DataMocks.data_discipline_choose, format="json"
        )
        self.assertEqual(response.status_code, status.HTTP_405_METHOD_NOT_ALLOWED)


class TestScoreDisciplineByStudent(APITestCase):
    def setUp(self):
        token = create_student_and_get_token(self)
        self.client.credentials(HTTP_AUTHORIZATION=f"Bearer {token}")

    def test_score_discipline_by_student_success(self):
        response = self.client.get(ApiRouteMocks().url_api_discipline_score_student, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_score_discipline_by_student_fail_unauthorized(self):
        self.client.credentials(HTTP_AUTHORIZATION="Bearer invalid_token")
        response = self.client.get(ApiRouteMocks().url_api_discipline_score_student, format="json")
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_score_discipline_by_student_not_empty(self):
        create_teacher(self)
        teacher_instance = Teacher.objects.get(
            phone=DataMocks.data_teacher["phone"], name=DataMocks.data_teacher["name"]
        )
        create_semester(self, "semester_1")
        semester_instance = Semester.objects.get(id=1)
        student_instance = Student.objects.get(phone="12345678", name="userStudent")
        create_discipline(self, name="Matematica", ano="2017", teacher=teacher_instance, semester=semester_instance)
        discipline_instance = Discipline.objects.get(
            name="Matematica", ano="2017", teacher=teacher_instance, semester=semester_instance
        )
        create_score(self, score="5", student=student_instance, discipline=discipline_instance)
        response = self.client.get(ApiRouteMocks().url_api_discipline_score_student, format="json")
        self.assertEqual(len(response.data), 1)
