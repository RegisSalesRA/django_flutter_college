from django.contrib import admin
from django.urls import include, path
from drf_yasg import openapi
from drf_yasg.views import get_schema_view
from rest_framework import permissions
from rest_framework.authentication import BasicAuthentication, SessionAuthentication
from rest_framework.permissions import IsAdminUser
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

...

schema_view = get_schema_view(
    openapi.Info(
        title="College API",
        default_version="v1",
        description="Test description",
        contact=openapi.Contact(email="contact@regis"),
        license=openapi.License(name="Open for free"),
    ),
    public=True,
    permission_classes=[IsAdminUser],
    authentication_classes=(SessionAuthentication, BasicAuthentication),
)


urlpatterns = [
    path("api/", include("core.v1.urls.urls_v1")),
    path("admin/", admin.site.urls),
    path("api/token/", TokenObtainPairView.as_view(), name="token_obtain_pair"),
    path("api/token/refresh/", TokenRefreshView.as_view(), name="token_refresh"),
    path("swagger/", schema_view.with_ui("swagger", cache_timeout=0), name="schema-swagger-ui"),
    path("redoc/", schema_view.with_ui("redoc", cache_timeout=0), name="schema-redoc"),
]
