from abc import ABC, abstractmethod


class ApiRouteInterface(ABC):
    @property
    @abstractmethod
    def url_api_user(self):
        pass

    @property
    @abstractmethod
    def url_api_token(self):
        pass

    @property
    @abstractmethod
    def url_signup_student(self):
        pass

    @property
    @abstractmethod
    def url_signup_teacher(self):
        pass

    @property
    @abstractmethod
    def url_api_discipline_left_student(self):
        pass

    @property
    @abstractmethod
    def url_api_discipline_teacher(self):
        pass

    @property
    @abstractmethod
    def url_api_discipline_student(self):
        pass

    @property
    @abstractmethod
    def url_api_score_add_student(self):
        pass

    @property
    @abstractmethod
    def url_api_discipline_chose_by_student(self):
        pass

    @property
    @abstractmethod
    def url_api_discipline_score_student(self):
        pass


class ApiRouteMocks(ApiRouteInterface):
    @property
    def url_api_user(self):
        return "/api/user/"

    @property
    def url_api_token(self):
        return "/api/token/"

    @property
    def url_signup_student(self):
        return "/api/signup/student/"

    @property
    def url_signup_teacher(self):
        return "/api/signup/teacher/"

    @property
    def url_api_discipline_left_student(self):
        return "/api/discipline_left_student/"

    @property
    def url_api_discipline_teacher(self):
        return "/api/discipline_teacher/"

    @property
    def url_api_discipline_student(self):
        return "/api/discipline_student/"

    @property
    def url_api_score_add_student(self):
        return "/api/score_add_student/"

    @property
    def url_api_discipline_chose_by_student(self):
        return "/api/discipline_chose/"

    @property
    def url_api_discipline_score_student(self):
        return "/api/discipline_score_student/"
