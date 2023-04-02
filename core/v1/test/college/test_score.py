from rest_framework.test import APIClient
from django.contrib.auth import get_user_model
from rest_framework import status
from django.urls import reverse
from rest_framework.test import APITestCase
from core.v1.mocks.api_routes_mock import ApiRouteMocks

from core.v1.mocks.payload_mock import PayLoadMocks
from core.v1.models.auth_models import Student, Teacher
from core.v1.models.college_models import Discipline, Scores, Semester
 
client = APIClient()

class TestScoreInsertStudenteApi(APITestCase):

    def setUp(self):

        data_teacher = PayLoadMocks.data_teacher
        data_student = PayLoadMocks.data_student
        response = self.client.post(ApiRouteMocks.url_signup_teacher, data_teacher, format='json')
        self.client.post(ApiRouteMocks.url_signup_student, data_student, format='json')
        data = PayLoadMocks.data_user_teacher
        response = self.client.post(ApiRouteMocks.url_api_token, data, format='json')
        token = response.data['access']
        self.client.credentials(HTTP_AUTHORIZATION=f'Bearer {token}')


    def test_score_insert_student_api_success(self):

        teacher_instance = Teacher.objects.get(phone=PayLoadMocks.data_teacher["phone"])
        Semester.objects.create(id=1,semester='semester_1')
        semester_instance = Semester.objects.get(id=1)
        student_instance = Student.objects.get(phone="12345678", name="user")
        discipline = Discipline.objects.create( name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        discipline = Discipline.objects.create( name="Matematica", ano= "2017", teacher=teacher_instance,semester=semester_instance)
        discipline_instance = Discipline.objects.get(name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        discipline_instance.student.add(student_instance.id)
        
        response = self.client.post(ApiRouteMocks.url_api_score_add_student, PayLoadMocks.data_score,format='json')
        self.assertEqual(response.status_code,status.HTTP_201_CREATED)
        self.assertEqual(response.data,{'success': 'create'})

    def test_score_insert_student_api_already_exists(self):

        teacher_instance = Teacher.objects.get(phone=PayLoadMocks.data_teacher["phone"])
        Semester.objects.create(id=1,semester='semester_1')
        semester_instance = Semester.objects.get(id=1)
        student_instance = Student.objects.get(phone="12345678", name="user")
        discipline = Discipline.objects.create( name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        discipline = Discipline.objects.create( name="Matematica", ano= "2017", teacher=teacher_instance,semester=semester_instance)
        discipline_instance = Discipline.objects.get(name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        discipline_instance.student.add(student_instance.id)
        query_score = Scores.objects.create(aluno=student_instance, discipline=discipline_instance, score=10)
        query_score.save() 
        PayLoadMocks.data_score
    
        response = self.client.post(ApiRouteMocks.url_api_score_add_student, PayLoadMocks.data_score,format='json')

        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
        self.assertEqual(response.data,{'error': 'object alerady exists'})
        

    def test_score_insert_student_api_fail(self):
        teacher_instance = Teacher.objects.get(phone=PayLoadMocks.data_teacher["phone"])
        Semester.objects.create(id=1,semester='semester_1')
        semester_instance = Semester.objects.get(id=1)
        student_instance = Student.objects.get(phone="12345678", name="user")
        discipline = Discipline.objects.create( name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        discipline = Discipline.objects.create( name="Matematica", ano= "2017", teacher=teacher_instance,semester=semester_instance)
        discipline_instance = Discipline.objects.get(name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        discipline_instance.student.add(student_instance.id)
        self.client.credentials(HTTP_AUTHORIZATION=f'Bearer invalid_token')
        response = self.client.post(ApiRouteMocks.url_api_score_add_student, PayLoadMocks.data_score,format='json')
      
        self.assertEqual(response.status_code,status.HTTP_401_UNAUTHORIZED)
