from core.v1.models.college_models import Discipline, Semester


def create_semester(self, name):
    Semester.objects.create(id=1, semester=name)


def create_discipline(self, name, ano, teacher, semester):
    Discipline.objects.create(name=name, ano=ano, teacher=teacher, semester=semester)
