from django.urls import path,include

urlpatterns = [
    path('v1/', include('core.v1.urls'))
]