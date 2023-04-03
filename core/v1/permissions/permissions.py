from rest_framework.permissions import BasePermission

class StudentUser(BasePermission):
    def has_permission(self, request, view):
        if request.user and request.user.is_student is True:
            return True


class TeacherUser(BasePermission):
    def has_permission(self, request, view):
        if request.user and request.user.is_teacher is True:
            return True
