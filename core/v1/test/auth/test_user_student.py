import json
from rest_framework.test import APIClient
from django.contrib.auth import get_user_model
from rest_framework import status
from django.urls import reverse
from rest_framework.test import APITestCase
from core.v1.models.auth_models import User, Student
from django.test import TestCase
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