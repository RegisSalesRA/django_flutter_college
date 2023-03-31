from rest_framework.test import APIClient
from django.contrib.auth import get_user_model
from rest_framework import status
from django.urls import reverse
from rest_framework.test import APITestCase

from core.v1.mocks.api_routes_mock import ApiRouteMocks
from core.v1.mocks.payload_mock import PayLoadMocks
from core.v1.models.auth_models import Teacher
from core.v1.models.college_models import Discipline


client = APIClient()


class TestDisciplineApi(APITestCase):
    discpline_url = ApiRouteMocks.url_api_discipline_left_student
    def setUp(self):
        data_student = PayLoadMocks.data_student
        response = self.client.post(ApiRouteMocks.url_signup_student, data_student, format='json')
        data = PayLoadMocks.data_user_student
        response = self.client.post(ApiRouteMocks.url_api_token, data, format='json')
        token = response.data['access']
        self.client.credentials(HTTP_AUTHORIZATION=f'Bearer {token}')


    def test_get_discpline_list_success(self):
        client.post(ApiRouteMocks.url_signup_teacher, PayLoadMocks.data_teacher)
        teacher_instance = Teacher.objects.get(phone=PayLoadMocks.data_teacher["phone"])
        print(dir(teacher_instance.user.id))
        #discipline = Discipline.objects.create( name="Geo", ano= "2014", teacher=teacher, semester=1,student=[1])
        
        response = self.client.get(ApiRouteMocks.url_api_discipline_left_student)
        #print(response.data)
        self.assertEqual(response.status_code,status.HTTP_200_OK)