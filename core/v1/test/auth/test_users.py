from rest_framework import status
from rest_framework.test import APIClient, APITestCase

from core.v1.mocks.api_routes_mock import ApiRouteMocks
from core.v1.mocks.payload_mock import PayLoadMocks

client = APIClient()
ApiRouteMocks()


class TestLoginUserStudent(APITestCase):
    def setUp(self):
        data_student = PayLoadMocks.data_student
        self.client.post(ApiRouteMocks.url_signup_student, data_student, format="json")
        self.data = PayLoadMocks.data_user_student
        self.wrong_data = PayLoadMocks.data_user_student_wrong

    def test_login_user_student_success(self):
        response = self.client.post(ApiRouteMocks.url_api_token, self.data)
        self.assertEqual(response.status_code, status.HTTP_200_OK, response.content)

    def test_login_user_student_fail(self):
        response = self.client.post(ApiRouteMocks.url_api_token, self.wrong_data)
        self.assertEqual(
            response.status_code, status.HTTP_401_UNAUTHORIZED, response.content
        )


class TestGetStudentUserLogged(APITestCase):
    def setUp(self):
        data_student = PayLoadMocks.data_student
        response = self.client.post(
            ApiRouteMocks.url_signup_student, data_student, format="json"
        )
        data = PayLoadMocks.data_user_student
        response = self.client.post(ApiRouteMocks.url_api_token, data, format="json")
        token = response.data["access"]
        self.client.credentials(HTTP_AUTHORIZATION=f"Bearer {token}")

    def test_get_user_logged_success(self):
        response = self.client.get(ApiRouteMocks.url_api_user)
        self.assertEqual(response.status_code, status.HTTP_200_OK, response.content)

    def test_get_user_logged_fail(self):
        self.client.credentials(HTTP_AUTHORIZATION="Bearer invalid_token")
        response = self.client.get(ApiRouteMocks.url_api_user)
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)


class TestSignUpStudentTest(APITestCase):
    def setUp(self):
        self.data_student = PayLoadMocks.data_student
        self.data_user_student_wrong = PayLoadMocks.data_user_student_wrong

    def test_signup_student_success(self):
        response = self.client.post(ApiRouteMocks.url_signup_student, self.data_student)
        self.assertEqual(
            response.status_code, status.HTTP_201_CREATED, response.content
        )

    def test_signup_student_fail(self):
        response = self.client.post(
            ApiRouteMocks.url_signup_student, self.data_user_student_wrong
        )
        self.assertEqual(
            response.status_code, status.HTTP_400_BAD_REQUEST, response.content
        )


class TestLoginUserTeacher(APITestCase):
    def setUp(self):
        data_teacher = PayLoadMocks.data_teacher
        self.client.post(ApiRouteMocks.url_signup_teacher, data_teacher, format="json")
        self.data = PayLoadMocks.data_user_teacher
        self.wrong_data = PayLoadMocks.data_user_teacher_wrong

    def test_login_user_teacher_success(self):
        response = self.client.post(ApiRouteMocks.url_api_token, self.data)
        self.assertEqual(response.status_code, status.HTTP_200_OK, response.content)

    def test_login_user_teacher_fail(self):
        response = self.client.post(ApiRouteMocks.url_api_token, self.wrong_data)
        self.assertEqual(
            response.status_code, status.HTTP_401_UNAUTHORIZED, response.content
        )


class TestGetTeacherUserLogged(APITestCase):
    def setUp(self):
        data_teacher = PayLoadMocks.data_teacher
        response = self.client.post(
            ApiRouteMocks.url_signup_teacher, data_teacher, format="json"
        )
        data = PayLoadMocks.data_user_teacher
        response = self.client.post(ApiRouteMocks.url_api_token, data, format="json")
        token = response.data["access"]
        self.client.credentials(HTTP_AUTHORIZATION=f"Bearer {token}")

    def test_get_user_logged_success(self):
        response = self.client.get(ApiRouteMocks.url_api_user)
        self.assertEqual(response.status_code, status.HTTP_200_OK, response.content)

    def test_get_user_logged_fail(self):
        self.client.credentials(HTTP_AUTHORIZATION="Bearer invalid_token")
        response = self.client.get(ApiRouteMocks.url_api_user)
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)


class TestSignUpTeacherTest(APITestCase):
    def setUp(self):
        self.data_teacher = PayLoadMocks.data_teacher
        self.data_user_teacher_wrong = PayLoadMocks.data_user_teacher_wrong

    def test_signup_teacher_success(self):
        response = self.client.post(ApiRouteMocks.url_signup_teacher, self.data_teacher)
        self.assertEqual(
            response.status_code, status.HTTP_201_CREATED, response.content
        )

    def test_signup_teacher_fail(self):
        response = self.client.post(
            ApiRouteMocks.url_signup_teacher, self.data_user_teacher_wrong
        )
        self.assertEqual(
            response.status_code, status.HTTP_400_BAD_REQUEST, response.content
        )
