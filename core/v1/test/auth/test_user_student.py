from rest_framework.test import APIClient
from rest_framework import status
from rest_framework.test import APITestCase
from core.v1.models.auth_models import User, Student


client = APIClient()




class UserLoginStudentTests(APITestCase):

    def setUp(self):
        self.email = 'admin@example.com'
        self.username = 'admin'
        self.password = 'password'
        self.user = User.objects.create_user(
            self.username, self.email, self.password)
        self.data = {
            'username': self.username,
            'password': self.password
        } 

        
    def test_login_student_user(self):
        url = '/api/token/'
        response = self.client.post(url, self.data)
        self.assertEqual(response.status_code, status.HTTP_200_OK, response.content)

 
class GetCurrentStudentUserTest(APITestCase):
    url = '/api/user/'
    url_token = '/api/token/'

    def setUp(self):
        
        user = User.objects.create_user(username='self.username', password= 'self.password', is_active=True)
        student = Student(user=user, name='self.name', phone='self.phone')
        print(student.user.username)
        self.data = {
            'username':str(student.user.username),
            'password': str(student.user.password)
        } 

        response = self.client.post(self.url_token, self.data, format='json')
        print(response.data)
        token = response.data['access']
        self.client.credentials(HTTP_AUTHORIZATION=f'Bearer {token}') 

        
    def test_get_current_student_user(self):
        pass
        #response = self.client.get(self.url)
        #print(f'response print = {response.data}')
        #self.assertEqual(response.status_code, status.HTTP_200_OK, response.content)





class UserSignUpStudentTest(APITestCase):

    def setUp(self):    
        self.data_student = {
        "username": "admin",
        "name": "adminName",
        "phone": "123456789",
        "password": "adminadmin",
        "password2" : "adminadmin"
     }


    def test_signup_student(self):
        url = '/api/signup/student/'
        response = self.client.post(url, self.data_student)
        self.assertEqual(response.status_code, status.HTTP_200_OK, response.content)

        