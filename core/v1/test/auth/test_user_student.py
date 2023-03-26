from rest_framework.test import APIClient
from rest_framework import status
from rest_framework.test import APITestCase
from core.v1.mocks.api_routes_mock import ApiRouteMocks
from core.v1.mocks.payload_mock import PayLoadMocks


client = APIClient()
ApiRouteMocks()

class UserLoginStudentTests(APITestCase):

    def setUp(self):
        data_student = PayLoadMocks.data_student
        self.client.post(ApiRouteMocks.url_student, data_student, format='json')
        self.data = PayLoadMocks.data_user
        
    def test_login_student_user(self):
        
        response = self.client.post(ApiRouteMocks.url_token, self.data)
        self.assertEqual(response.status_code, status.HTTP_200_OK, response.content)

 
class GetCurrentStudentUserTest(APITestCase):

    def setUp(self):
        
        data_student = PayLoadMocks.data_student
        response = self.client.post(ApiRouteMocks.url_student, data_student, format='json')
        data = PayLoadMocks.data_user
        response = self.client.post(ApiRouteMocks.url_token, data, format='json')
        token = response.data['access']
        self.client.credentials(HTTP_AUTHORIZATION=f'Bearer {token}') 
        
    def test_get_current_student_user(self):
        
        response = self.client.get(ApiRouteMocks.url)
        self.assertEqual(response.status_code, status.HTTP_200_OK, response.content)



class UserSignUpStudentTest(APITestCase):

    def setUp(self):    
        self.data_student = PayLoadMocks.data_student


    def test_signup_student(self):
        response = self.client.post(ApiRouteMocks.url_student, self.data_student)
        self.assertEqual(response.status_code, status.HTTP_200_OK, response.content)

        