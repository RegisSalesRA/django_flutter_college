from rest_framework.test import APIClient
from rest_framework import status
from rest_framework.test import APITestCase

from core.v1.mocks.api_routes_mock import ApiRouteMocks
from core.v1.mocks.payload_mock import PayLoadMocks
from core.v1.models.auth_models import Student, Teacher
from core.v1.models.college_models import Discipline, Semester


client = APIClient()


class TestDisciplineLeftByStudentApi(APITestCase):
    discpline_url = ApiRouteMocks.url_api_discipline_left_student

    def setUp(self):

        data_student = PayLoadMocks.data_student
        response = self.client.post(ApiRouteMocks.url_signup_student, data_student, format='json')
        data = PayLoadMocks.data_user_student
        response = self.client.post(ApiRouteMocks.url_api_token, data, format='json')
        token = response.data['access']
        self.client.credentials(HTTP_AUTHORIZATION=f'Bearer {token}')


    def test_get_discpline_left_by_sudent_success(self):

        client.post(ApiRouteMocks.url_signup_teacher, PayLoadMocks.data_teacher)
        teacher_instance = Teacher.objects.get(phone=PayLoadMocks.data_teacher["phone"])
        Semester.objects.create(id=1,semester='semester_1')
        semester_instance = Semester.objects.get(id=1)
        student_instance = Student.objects.get(phone="12345678", name="user")
        Discipline.objects.create( name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        Discipline.objects.create( name="Matematica", ano= "2017", teacher=teacher_instance,semester=semester_instance)
        discipline_instance = Discipline.objects.get(name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        discipline_instance.student.add(student_instance.id)

        response = self.client.get(ApiRouteMocks.url_api_discipline_left_student)
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)


    def test_get_discpline_left_by_sudent_fail(self):
        
        self.client.credentials(HTTP_AUTHORIZATION='Bearer invalid_token')
        response = self.client.get(ApiRouteMocks.url_api_discipline_left_student)
        self.assertEqual(response.status_code,status.HTTP_401_UNAUTHORIZED)
        self.assertEqual(response.data["detail"], "Given token not valid for any token type")



class TestDisciplineByStudentApi(APITestCase):

    def setUp(self):

        data_student = PayLoadMocks.data_student
        response = self.client.post(ApiRouteMocks.url_signup_student, data_student, format='json')
        data = PayLoadMocks.data_user_student
        response = self.client.post(ApiRouteMocks.url_api_token, data, format='json')
        token = response.data['access']
        self.client.credentials(HTTP_AUTHORIZATION=f'Bearer {token}')

    def test_discipline_by_student_success(self):

        client.post(ApiRouteMocks.url_signup_teacher, PayLoadMocks.data_teacher)
        teacher_instance = Teacher.objects.get(phone=PayLoadMocks.data_teacher["phone"])
        Semester.objects.create(id=1,semester='semester_1')
        semester_instance = Semester.objects.get(id=1)
        student_instance = Student.objects.get(phone="12345678", name="user")
        Discipline.objects.create( name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        Discipline.objects.create( name="Matematica", ano= "2017", teacher=teacher_instance,semester=semester_instance)
        discipline_instance = Discipline.objects.get(name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        discipline_instance.student.add(student_instance.id)

        response = self.client.get(ApiRouteMocks.url_api_discipline_student)
        self.assertEqual(response.status_code,status.HTTP_200_OK)

    
    def test_discipline_by_student_fail(self):

        client.post(ApiRouteMocks.url_signup_teacher, PayLoadMocks.data_teacher)
        teacher_instance = Teacher.objects.get(phone=PayLoadMocks.data_teacher["phone"])
        Semester.objects.create(id=1,semester='semester_1')
        semester_instance = Semester.objects.get(id=1)
        student_instance = Student.objects.get(phone="12345678", name="user")
        Discipline.objects.create( name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        Discipline.objects.create( name="Matematica", ano= "2017", teacher=teacher_instance,semester=semester_instance)
        discipline_instance = Discipline.objects.get(name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        discipline_instance.student.add(student_instance.id)
        self.client.credentials(HTTP_AUTHORIZATION='Bearer invalid_token')

        response = self.client.get(ApiRouteMocks.url_api_discipline_student)

        self.assertEqual(response.status_code,status.HTTP_401_UNAUTHORIZED)

    
    def test_discipline_by_student_fail_forbidden(self):

        client.post(ApiRouteMocks.url_signup_teacher, PayLoadMocks.data_teacher)
        teacher_instance = Teacher.objects.get(phone=PayLoadMocks.data_teacher["phone"])
        Semester.objects.create(id=1,semester='semester_1')
        semester_instance = Semester.objects.get(id=1)
        student_instance = Student.objects.get(phone="12345678", name="user")
        Discipline.objects.create( name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        Discipline.objects.create( name="Matematica", ano= "2017", teacher=teacher_instance,semester=semester_instance)
        discipline_instance = Discipline.objects.get(name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        discipline_instance.student.add(student_instance.id)

        response = self.client.get(ApiRouteMocks.url_api_discipline_teacher)

        self.assertEqual(response.status_code,status.HTTP_403_FORBIDDEN)


class TestDisciplineByTeacherApi(APITestCase):

    def setUp(self):

        data_teacher = PayLoadMocks.data_teacher
        data_student = PayLoadMocks.data_student
        response = self.client.post(ApiRouteMocks.url_signup_teacher, data_teacher, format='json')
        response = self.client.post(ApiRouteMocks.url_signup_student, data_student, format='json')
        data = PayLoadMocks.data_user_teacher
        response = self.client.post(ApiRouteMocks.url_api_token, data, format='json')
        token = response.data['access']
        self.client.credentials(HTTP_AUTHORIZATION=f'Bearer {token}')

    def test_discipline_by_teacher_success(self):

        teacher_instance = Teacher.objects.get(phone=PayLoadMocks.data_teacher["phone"])
        Semester.objects.create(id=1,semester='semester_1')
        semester_instance = Semester.objects.get(id=1)
        student_instance = Student.objects.get(phone="12345678", name="user")
        Discipline.objects.create( name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        Discipline.objects.create( name="Matematica", ano= "2017", teacher=teacher_instance,semester=semester_instance)
        discipline_instance = Discipline.objects.get(name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        discipline_instance.student.add(student_instance.id)

        response = self.client.get(ApiRouteMocks.url_api_discipline_teacher)
        self.assertEqual(response.status_code,status.HTTP_200_OK)


   
    def test_discipline_by_teacher_fail(self):

        client.post(ApiRouteMocks.url_signup_teacher, PayLoadMocks.data_teacher)
        teacher_instance = Teacher.objects.get(phone=PayLoadMocks.data_teacher["phone"])
        Semester.objects.create(id=1,semester='semester_1')
        semester_instance = Semester.objects.get(id=1)
        student_instance = Student.objects.get(phone="12345678", name="user")
        Discipline.objects.create( name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        Discipline.objects.create( name="Matematica", ano= "2017", teacher=teacher_instance,semester=semester_instance)
        discipline_instance = Discipline.objects.get(name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        discipline_instance.student.add(student_instance.id)
        self.client.credentials(HTTP_AUTHORIZATION='Bearer invalid_token')

        response = self.client.get(ApiRouteMocks.url_api_discipline_teacher)

        self.assertEqual(response.status_code,status.HTTP_401_UNAUTHORIZED)

    
    def test_discipline_by_teacher_fail_forbidden(self):

        client.post(ApiRouteMocks.url_signup_teacher, PayLoadMocks.data_teacher)
        teacher_instance = Teacher.objects.get(phone=PayLoadMocks.data_teacher["phone"])
        Semester.objects.create(id=1,semester='semester_1')
        semester_instance = Semester.objects.get(id=1)
        student_instance = Student.objects.get(phone="12345678", name="user")
        Discipline.objects.create( name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        Discipline.objects.create( name="Matematica", ano= "2017", teacher=teacher_instance,semester=semester_instance)
        discipline_instance = Discipline.objects.get(name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        discipline_instance.student.add(student_instance.id)

        response = self.client.get(ApiRouteMocks.url_api_discipline_student)

        self.assertEqual(response.status_code,status.HTTP_403_FORBIDDEN)
 


class TestDisciplineChoseByStudent(APITestCase):
    def setUp(self):
        
        data_student = PayLoadMocks.data_student
        self.client.post(ApiRouteMocks.url_signup_student, data_student, format='json')
        data = PayLoadMocks.data_user_student
        response = self.client.post(ApiRouteMocks.url_api_token, data, format='json')
        token = response.data['access']
        self.client.credentials(HTTP_AUTHORIZATION=f'Bearer {token}')
    
    def test_discipline_chose_by_student_success(self):

        client.post(ApiRouteMocks.url_signup_teacher, PayLoadMocks.data_teacher)
        teacher_instance = Teacher.objects.get(phone=PayLoadMocks.data_teacher["phone"])
        Semester.objects.create(id=1,semester='semester_1')
        semester_instance = Semester.objects.get(id=1)
        Discipline.objects.create( name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        Discipline.objects.create( name="Matematica", ano= "2017", teacher=teacher_instance,semester=semester_instance)
        
        response = self.client.post(ApiRouteMocks.url_api_discipline_chose_by_student,PayLoadMocks.data_discipline_choose,format='json')

        self.assertEqual(response.status_code,status.HTTP_200_OK)
        self.assertEqual(response.data,{'success': 'create'})

    def test_discipline_chose_by_student_already_created_fail(self):
        student_instance = Student.objects.get(phone="12345678", name="user")
        client.post(ApiRouteMocks.url_signup_teacher, PayLoadMocks.data_teacher)
        teacher_instance = Teacher.objects.get(phone=PayLoadMocks.data_teacher["phone"])
        Semester.objects.create(id=1,semester='semester_1')
        semester_instance = Semester.objects.get(id=1)
        Discipline.objects.create( name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        Discipline.objects.create( name="Matematica", ano= "2017", teacher=teacher_instance,semester=semester_instance)
        discipline_instance = Discipline.objects.get(name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        discipline_instance.student.add(student_instance.id)
        
        response = self.client.post(ApiRouteMocks.url_api_discipline_chose_by_student,PayLoadMocks.data_discipline_choose,format='json')
        
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
        self.assertEqual(response.data,{'error': 'object alerady exists'})

    def test_discipline_chose_by_student_fail_unauthorized(self):

        client.post(ApiRouteMocks.url_signup_teacher, PayLoadMocks.data_teacher)
        teacher_instance = Teacher.objects.get(phone=PayLoadMocks.data_teacher["phone"])
        Semester.objects.create(id=1,semester='semester_1')
        semester_instance = Semester.objects.get(id=1)
        Discipline.objects.create( name="Geo", ano= "2014", teacher=teacher_instance,semester=semester_instance)
        Discipline.objects.create( name="Matematica", ano= "2017", teacher=teacher_instance,semester=semester_instance)
        self.client.credentials(HTTP_AUTHORIZATION='Bearer invalid_token')

        response = self.client.post(ApiRouteMocks.url_api_discipline_chose_by_student,PayLoadMocks.data_discipline_choose,format='json')
        self.assertEqual(response.status_code,status.HTTP_401_UNAUTHORIZED)

    def test_discipline_chose_by_student_fail_methodo_not_allowed(self):

        response = self.client.get(ApiRouteMocks.url_api_discipline_chose_by_student,PayLoadMocks.data_discipline_choose,format='json')
        self.assertEqual(response.status_code,status.HTTP_405_METHOD_NOT_ALLOWED)

        