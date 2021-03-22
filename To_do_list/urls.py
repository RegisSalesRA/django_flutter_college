from django.urls import path
from django.urls.resolvers import URLPattern

from .views import ListToDoList,DetailToDoList

urlpattern = [
    path('',ListToDoList.as_view()),
    path('<int:pk>',DetailToDoList.as_view()),
]
