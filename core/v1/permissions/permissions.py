from rest_framework.permissions import BasePermission

class StudentUser(BasePermission):
    def has_permission(self, request, view):
        if request.user and request.user.is_student == True:
            return True


class TeacherUser(BasePermission):
    def has_permission(self, request, view):
        if request.user and request.user.is_teacher == True:
            return True
