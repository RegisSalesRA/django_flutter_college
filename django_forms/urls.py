from django.urls import path
from django.urls.resolvers import URLPattern

from django_forms.views import CadastroFormList,DetailCadastroFormList

urlpatterns = [
    path('',CadastroFormList.as_view()),
    path('<int:pk>',DetailCadastroFormList.as_view()),
]
