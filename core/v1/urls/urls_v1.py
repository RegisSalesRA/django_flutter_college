from django.urls import path

from core.v1.views.auth_views import (
    GetUser,
    StudentListCreateView,
    StudentSignupView,
    TeacherListCreateView,
    TeacherSignupView,
)
from core.v1.views.college_views import (
    ChoseDisciplineByStudent,
    DisciplineCreateView,
    DisciplineListByTeacher,
    DisciplineListLeftStudent,
    DisciplineListView,
    DisciplineRetrieveUpdateDestroyView,
    DisciplinyByStudent,
    InsertScoreToStudent,
    ScoreDisciplineByStudent,
    ScoresCreateView,
    ScoresListView,
    ScoresRetrieveUpdateDestroyView,
    SemesterListCreateView,
    SemesterRetrieveUpdateDestroyView,
)

urlpatterns = [
    # Admin
    path("discipline/", DisciplineListView.as_view()),
    path("discipline_post/", DisciplineCreateView.as_view()),
    path("discipline/<int:pk>/", DisciplineRetrieveUpdateDestroyView.as_view()),
    path("semester/", SemesterListCreateView.as_view()),
    path("semester/<int:pk>/", SemesterRetrieveUpdateDestroyView.as_view()),
    path("score/", ScoresListView.as_view()),
    path("score/<int:pk>/", ScoresRetrieveUpdateDestroyView.as_view()),
    path("score_add/", ScoresCreateView.as_view()),
    # College
    path("discipline_score_student/", ScoreDisciplineByStudent.as_view()),
    path("discipline_student/", DisciplinyByStudent.as_view()),
    path("discipline_chose/", ChoseDisciplineByStudent.as_view()),
    path("discipline_left_student/", DisciplineListLeftStudent.as_view()),
    path("discipline_teacher/", DisciplineListByTeacher.as_view()),
    path("score_add_student/", InsertScoreToStudent.as_view()),
    # Auth
    path("signup/student/", StudentSignupView.as_view()),
    path("student/", StudentListCreateView.as_view()),
    path("teacher/", TeacherListCreateView.as_view()),
    path("signup/teacher/", TeacherSignupView.as_view()),
    path("user/", GetUser.as_view()),
]
