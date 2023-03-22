from django.urls import path
from .views import (
    StudentSignupView,GetUser
)

urlpatterns = [
    path("signup/student/", StudentSignupView.as_view()),
    path("user/", GetUser.as_view())
]
