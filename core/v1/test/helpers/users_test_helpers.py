from core.v1.mocks.api_routes_mock import ApiRouteMocks
from core.v1.mocks.data_mock import DataMocks


def create_student_and_get_token(self):
    data_student = DataMocks.data_student
    url_signup_student = ApiRouteMocks().url_signup_student
    url_api_token = ApiRouteMocks().url_api_token
    data_user_student = DataMocks.data_user_student
    self.client.post(url_signup_student, data_student, format="json")
    response = self.client.post(url_api_token, data_user_student, format="json")
    token = response.data["access"]

    return token


def create_teacher_and_get_token(self):
    data_teacher = DataMocks.data_teacher
    url_signup_teacher = ApiRouteMocks().url_signup_teacher
    url_api_token = ApiRouteMocks().url_api_token
    data_user_teacher = DataMocks.data_user_teacher
    self.client.post(url_signup_teacher, data_teacher, format="json")
    response = self.client.post(url_api_token, data_user_teacher, format="json")
    token = response.data["access"]

    return token


def create_teacher(self):
    data_teacher = DataMocks.data_teacher
    url_signup_teacher = ApiRouteMocks().url_signup_teacher
    self.client.post(url_signup_teacher, data_teacher, format="json")


def create_student(self):
    data_student = DataMocks.data_student
    url_signup_student = ApiRouteMocks().url_signup_student
    self.client.post(url_signup_student, data_student, format="json")
