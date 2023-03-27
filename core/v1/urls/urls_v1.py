from django.urls import path
from core.v1.views.auth_views import (
    StudentSignupView,GetUser
)
from core.v1.views.school_views import ( DisciplineListCreateView,DisciplineRetrieveUpdateDestroyView,SemesterListCreateView,SemesterRetrieveUpdateDestroyView,ScoresCreateView,ScoresListView,ScoresRetrieveUpdateDestroyView)

urlpatterns = [
    #School
    path("discipline/", DisciplineListCreateView.as_view()),
    path("discipline/<int:pk>/", DisciplineRetrieveUpdateDestroyView.as_view()),
    path("semester/", SemesterListCreateView.as_view()),
    path("semester/<int:pk>/", SemesterRetrieveUpdateDestroyView.as_view()),
    path("score/", ScoresListView.as_view()),
    path("score_add/", ScoresCreateView.as_view()),    
    path("score/<int:pk>/", ScoresRetrieveUpdateDestroyView.as_view()),
    #Auth
    path("signup/student/", StudentSignupView.as_view()),
    path("user/", GetUser.as_view())
]