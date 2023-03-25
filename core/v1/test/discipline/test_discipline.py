from rest_framework.test import APIClient
from django.contrib.auth import get_user_model
from rest_framework import status
from django.urls import reverse
from rest_framework.test import APITestCase


client = APIClient()


class TestDisciplineApi(APITestCase):
    discpline_url = '/api/discipline/'
    
    def test_get_discpline_list(self):
        response = self.client.get(self.discpline_url)
        self.assertEqual(response.status_code,200)
 

       