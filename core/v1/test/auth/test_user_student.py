from rest_framework.test import APIClient
from rest_framework import status
from rest_framework.test import APITestCase
from core.v1.mocks.api_routes_mock import ApiRouteMocks
from core.v1.mocks.payload_mock import PayLoadMocks


client = APIClient()
ApiRouteMocks()

class TestLoginUserStudent(APITestCase):

    def setUp(self):
        data_student = PayLoadMocks.data_student
        self.client.post(ApiRouteMocks.url_signup_student, data_student, format='json')
        self.data = PayLoadMocks.data_user
        
    def test_login_user_student_success(self):
        
        response = self.client.post(ApiRouteMocks.url_api_token, self.data)
        self.assertEqual(response.status_code, status.HTTP_200_OK, response.content)

 
class TestGetUserLogged(APITestCase):

    def setUp(self):
        
        data_student = PayLoadMocks.data_student
        response = self.client.post(ApiRouteMocks.url_signup_student, data_student, format='json')
        data = PayLoadMocks.data_user
        response = self.client.post(ApiRouteMocks.url_api_token, data, format='json')
        token = response.data['access']
        self.client.credentials(HTTP_AUTHORIZATION=f'Bearer {token}') 
        
    def test_get_user_logged_success(self):
        
        response = self.client.get(ApiRouteMocks.url_api_user)
        self.assertEqual(response.status_code, status.HTTP_200_OK, response.content)



class TestSignUpStudentTest(APITestCase):

    def setUp(self):    
        self.data_student = PayLoadMocks.data_student


    def test_signup_student_success(self):
        response = self.client.post(ApiRouteMocks.url_signup_student, self.data_student)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED, response.content)

        