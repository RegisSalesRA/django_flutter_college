from django.urls import path
from django.urls.resolvers import URLPattern

from django_forms.views import CadastroFormList,DetailCadastroFormList,FastCadastroList,DetailFastCadastroList

urlpatterns = [
    path('',CadastroFormList.as_view()),
    path('<int:pk>',DetailCadastroFormList.as_view()),
    path('cadastro/',FastCadastroList.as_view()),
    path('cadastro/<int:pk>',DetailFastCadastroList.as_view()),
]
