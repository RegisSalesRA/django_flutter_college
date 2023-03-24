import pytest
import json
from rest_framework.test import APIClient
from django.contrib.auth import get_user_model
from rest_framework import status
from django.urls import reverse
from rest_framework.test import APITestCase

User = get_user_model()
client = APIClient()


class TestDisciplineApi(APITestCase):
    discpline_url = '/api/discipline/'
    
    def test_get_discpline_list(self):
        response = self.client.get(self.discpline_url)
        self.assertEqual(response.status_code,200)

       
class TestScoreApi(APITestCase):
    score_url = '/api/score/'

    def test_get_score_list(self):
        response = self.client.get(self.score_url)
        self.assertEqual(response.status_code, 200)

       