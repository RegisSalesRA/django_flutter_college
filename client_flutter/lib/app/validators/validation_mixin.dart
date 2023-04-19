mixin ValidationMixin {
  String? inputCanNotBeEmptyOrNull(String? value, {String? errorMessage}) {
    if (value != null && value.isNotEmpty) {
      return null;
    } else {
      return errorMessage ?? "This Field can not be empty";
    }
  }

  String? passwordValidateLength(
    String? password, {
    String? errorMessage,
  }) {
    if (password != null && password.length > 6) {
      return null;
    } else {
      return errorMessage ?? "This password is too small";
    }
  }

  String? validationMatchingPassword(value, passwordController) {
    if (value == "") {
      return "This Field can not be empty!";
    }
    if (value != passwordController.text) {
      return "Password not matching!";
    }
    return null;
  }
}

String? isEmailValid(
  String? email, {
  String? errorMessage,
}) {
  if (email != null && email.isNotEmpty) {
    final RegExp regex = RegExp(
      r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$",
    );
    return regex.hasMatch(email) ? null : errorMessage ?? "email incorrect";
  } else {
    return errorMessage ?? "This Field can not be empty";
  }
}

String? isPhoneNumberValid(
  String? phone, {
  String? errorMessage,
}) {
  if (phone != null && phone.isNotEmpty) {
    final RegExp regex = RegExp(
      r'^1\d\d(\d\d)?$|^0800 ?\d{3} ?\d{4}$|^(\(0?([1-9a-zA-Z][0-9a-zA-Z])?[1-9]\d\) ?|0?([1-9a-zA-Z][0-9a-zA-Z])?[1-9]\d[ .-]?)?(9|9[ .-])?[2-9]\d{3}[ .-]?\d{4}$',
    );
    return regex.hasMatch(phone)
        ? null
        : errorMessage ?? "This number is not correct";
  } else {
    return errorMessage ?? "This Field can not be empty";
  }
}

String? nameValid(String? name) {
  String? response;
  if (name == null || name.isEmpty) {
    response = 'This Field can not be empty';
  } else if (name.trim().split(' ').length <= 1) {
    response = 'Type a valid name and with second name';
  } else {}
  return response;
}
