class DataMocks:
    data_student = {
        "username": "userStudent",
        "name": "userStudent",
        "password": "adminadmin",
        "password2": "adminadmin",
        "phone": "12345678",
    }

    def get_data_student(self):
        return self.data_student

    data_user_student = {
        "username": "userStudent",
        "password": "adminadmin",
    }

    data_user_student_wrong = {
        "username": "userStudentWrong",
        "password": "adminadmin",
    }

    data_teacher = {
        "username": "userTeacher",
        "name": "userProf",
        "password": "adminadmin",
        "password2": "adminadmin",
        "phone": "12345678",
    }

    def get_data_teacher(self):
        return self.data_teacher

    data_user_teacher = {
        "username": "userTeacher",
        "password": "adminadmin",
    }

    data_user_teacher_wrong = {
        "username": "userTeacherWrong",
        "password": "adminadmin",
    }

    data_discipline = (
        {
            "id": 1,
            "updateAt": "2023-03-30T17:45:17.053325Z",
            "createAt": "2023-03-28T16:27:06.585761Z",
            "name": "Geo",
            "ano": "2014",
            "teacher": {"id": 16, "phone": "123456789", "user": 17},
            "semester": {
                "id": 1,
                "updateAt": "2023-03-28T16:26:49.381590Z",
                "createAt": "2023-03-28T16:26:49.381590Z",
                "semester": "semester_1",
            },
            "student": [],
        },
    )

    data_score = {"id_student": 1, "id_discpline": 1, "nota": 10}

    data_discipline_choose = {"id_discpline": 1}
