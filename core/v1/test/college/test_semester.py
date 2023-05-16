from rest_framework import status
from rest_framework.test import APIClient, APITestCase

from core.v1.mocks.api_routes_mock import ApiRouteMocks
from core.v1.mocks.data_mock import DataMocks

client = APIClient()


class TestSemesterApi(APITestCase):
    def test_semester_post_api_success(self):
        response = self.client.post(ApiRouteMocks().url_api_semester_add, DataMocks.data_semester, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def test_semester_post_api_get_values(self):
        response = self.client.get(ApiRouteMocks().url_api_semester_add, format="json")

        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_semester_post_api_fail(self):
        self.client.post(ApiRouteMocks().url_api_semester_add, DataMocks.data_semester, format="json")
        response = self.client.post(ApiRouteMocks().url_api_semester_add, DataMocks.data_semester, format="json")

        self.assertEqual(response.status_code, status.HTTP_409_CONFLICT)

    def test_semester_post_api_bad_request(self):
        response = self.client.post(
            ApiRouteMocks().url_api_semester_add, DataMocks.data_semester_not_valid, format="json"
        )

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

    def test_semester_post_api_method_not_allowed(self):
        response = self.client.put(ApiRouteMocks().url_api_semester_add, DataMocks.data_semester, format="json")

        self.assertEqual(response.status_code, status.HTTP_405_METHOD_NOT_ALLOWED)
