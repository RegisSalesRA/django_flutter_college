from rest_framework.permissions import BasePermission


class StudentUser(BasePermission):
    def has_permission(self, request, view):
        return bool(request.user and request.user.is_student)


class TeacherUser(BasePermission):
    def has_permission(self, request, view):
        return bool(request.user and request.user.is_teacher)