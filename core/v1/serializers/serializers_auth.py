from rest_framework import serializers
from core.v1.models.auth_models import User, Student, Teacher


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["username", "email"]



class StudentSerializer(serializers.ModelSerializer):
    password2 = serializers.CharField(style={"input_type": "password"}, write_only=True)

    class Meta:
        model = User
        fields = ["username", "email", "password", "password2"]
        extra_kwargs = {"password": {"write_only": True}}

    def save(self, **kwargs):
        user = User(
            username=self.validated_data["username"], email=self.validated_data["email"]
        )
        password = self.validated_data["password"]
        password2 = self.validated_data["password2"]
        if password != password2:
            raise serializers.ValidationError({"error": "password do not match"})
        user.set_password(password)
        user.is_student = True
        user.save()
        Student.objects.create(user=user)
        return user


class TeacherSerializer(serializers.ModelSerializer):
    password2 = serializers.CharField(style={"input_type": "password"}, write_only=True)

    class Meta:
        model = User
        fields = ["username", "email", "password", "password2"]
        extra_kwargs = {"password": {"write_only": True}}

    def save(self, **kwargs):
        user = User(
            username=self.validated_data["username"], email=self.validated_data["email"]
        )
        password = self.validated_data["password"]
        password2 = self.validated_data["password2"]
        if password != password2:
            raise serializers.ValidationError({"error": "password do not match"})
        user.set_password(password)
        user.is_teacher = True
        user.save()
        Teacher.objects.create(user=user)
        return user
