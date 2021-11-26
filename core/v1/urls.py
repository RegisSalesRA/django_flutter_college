from django.urls import path

from core.v1.views import CadastroDetailView,CadastroView,CadastroFotoView,CadastroFotoDetailView

urlpatterns = [
    path('cadastro/',CadastroView.as_view()),
    path('cadastro/<int:pk>',CadastroDetailView.as_view()),
    path('cadastrofoto/',CadastroFotoView.as_view()),
    path('cadastrofoto/<int:pk>',CadastroFotoDetailView.as_view()),
]