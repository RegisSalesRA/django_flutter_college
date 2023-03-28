from rest_framework import serializers
from core.v1.models.auth_models import User, Student, Teacher


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["username", "email"]



class StudentSerializerRegister(serializers.ModelSerializer):
    password2 = serializers.CharField(style={"input_type": "password"}, write_only=True)
    phone = serializers.CharField(max_length=20, style={"input_type": "text"})
    name = serializers.CharField(max_length=255, style={"input_type": "text"})
    
    class Meta:
        model = User
        fields = ["username","password", "password2", "phone","name"]
        extra_kwargs = {"password": {"write_only": True}}

    def save(self, **kwargs):
        user = User(
            username=self.validated_data["username"]
        )
        password = self.validated_data["password"]
        password2 = self.validated_data["password2"]
        if password != password2:
            raise serializers.ValidationError({"error": "password do not match"})
        user.set_password(password)
        user.is_student = True
        user.save()
        Student.objects.create(user=user, name=self.validated_data["name"],phone=self.validated_data["phone"])
        return user



class TeacherSerializerRegister(serializers.ModelSerializer):
    password2 = serializers.CharField(style={"input_type": "password"}, write_only=True)
    phone = serializers.CharField(max_length=20, style={"input_type": "text"})
    class Meta:
        model = User
        fields = ["username", "phone", "password", "password2"]
        extra_kwargs = {"password": {"write_only": True}}

    def save(self, **kwargs):
        user = User(
            username=self.validated_data["username"]
        )
        password = self.validated_data["password"]
        password2 = self.validated_data["password2"]
        if password != password2:
            raise serializers.ValidationError({"error": "password do not match"})
        user.set_password(password)
        user.is_teacher = True
        user.save()
        Teacher.objects.create(user=user,phone=self.validated_data["phone"])
        return user


class TeacherSerializer(serializers.ModelSerializer):
    class Meta:
        model = Teacher
        fields = "__all__"
        depth = 1