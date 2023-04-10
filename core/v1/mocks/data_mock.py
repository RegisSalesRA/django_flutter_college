import json
from abc import ABC, abstractmethod


class PayLoadMocks:
    data_student = {
        "username": "userStudent",
        "name": "user",
        "password": "adminadmin",
        "password2": "adminadmin",
        "phone": "12345678",
    }

    data_user_student = {
        "username": "userStudent",
        "password": "adminadmin",
    }

    data_user_student_wrong = {
        "username": "userStudentWrong",
        "password": "adminadmin",
    }
    data_teacher = {"username": "userTeacher", "password": "adminadmin", "password2": "adminadmin", "phone": "12345678"}

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


class DataMocksAbstract(ABC):
    @abstractmethod
    def get_data_student(self):
        pass

    @abstractmethod
    def get_data_user_student(self):
        pass

    @abstractmethod
    def get_data_user_student_wrong(self):
        pass

    @abstractmethod
    def get_data_teacher(self):
        pass

    @abstractmethod
    def get_data_user_teacher(self):
        pass

    @abstractmethod
    def get_data_user_teacher_wrong(self):
        pass

    @abstractmethod
    def get_data_discipline(self):
        pass

    @abstractmethod
    def get_data_score(self):
        pass

    @abstractmethod
    def get_data_discipline_choose(self):
        pass


class DataMocks(DataMocksAbstract):
    def get_data_student(self):
        data = {
            "username": "userStudent",
            "name": "user",
            "password": "adminadmin",
            "password2": "adminadmin",
            "phone": "12345678",
        }
        data_json = json.dumps(data)
        return data_json

    def get_data_user_student(self):
        return {
            "username": "userStudent",
            "password": "adminadmin",
        }

    def get_data_user_student_wrong(self):
        return {
            "username": "userStudentWrong",
            "password": "adminadmin",
        }

    def get_data_teacher(self):
        return {"username": "userTeacher", "password": "adminadmin", "password2": "adminadmin", "phone": "12345678"}

    def get_data_user_teacher(self):
        return {
            "username": "userTeacher",
            "password": "adminadmin",
        }

    def get_data_user_teacher_wrong(self):
        return {
            "username": "userTeacherWrong",
            "password": "adminadmin",
        }

    def get_data_discipline(self):
        return (
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

    def get_data_score(self):
        return {"id_student": 1, "id_discpline": 1, "nota": 10}

    def get_data_discipline_choose(self):
        return {"id_discpline": 1}

    def to_dict(self):
        return {
            "data_student": self.data_student,
            "data_user_student": self.data_user_student,
            "data_user_student_wrong": self.data_user_student_wrong,
            "data_teacher": self.data_teacher,
            "data_user_teacher": self.data_user_teacher,
            "data_user_teacher_wrong": self.data_user_teacher_wrong,
            "data_discipline": self.data_discipline,
            "data_score": self.data_score,
            "data_discipline_choose": self.data_discipline_choose,
        }
