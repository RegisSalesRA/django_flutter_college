import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../app/app.dart';
import '../../../data/controllers/register_data_controller.dart';

class SignUpStudent extends StatefulWidget {
  final VoidCallback backPageView;
  const SignUpStudent({
    super.key,
    required this.backPageView,
  });

  @override
  State<SignUpStudent> createState() => _SignUpStudentState();
}

class _SignUpStudentState extends State<SignUpStudent> with ValidationMixin {
  final registerData = RegisterDataController();

  @override
  void initState() {
    if (!mounted) {}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorsTheme.secondaryColor,
          ),
          onPressed: widget.backPageView,
        ),
        title: const Text(
          "Signup Student",
          style: TextStyle(color: ColorsTheme.secondaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 100,
          ),
          Form(
            key: registerData.formKeyStudent,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: registerData.usernameController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person), hintText: 'Username'),
                  validator: inputCanNotBeEmptyOrNull,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: registerData.nameController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_rounded),
                      hintText: 'Name'),
                  validator: nameValid,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  inputFormatters: [
                    MaskTextInputFormatter(mask: "+# (###) ###-##-##")
                  ],
                  controller: registerData.phoneController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: '+1 (234) 567-89-01'),
                  validator: isPhoneNumberValid,
                ),
              ),
              ValueListenableBuilder<bool>(
                valueListenable: registerData.confirmPassword,
                builder: (context, isLoading, child) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        controller: registerData.passwordController,
                        obscureText: registerData.confirmPassword.value,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  registerData.confirmPassword.value =
                                      !registerData.confirmPassword.value;
                                },
                                icon: Icon(registerData.confirmPassword.value
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                            prefixIcon: const Icon(Icons.lock),
                            hintText: 'Password'),
                        validator: passwordValidateLength,
                      ));
                },
              ),
              ValueListenableBuilder<bool>(
                valueListenable: registerData.confirm2Password,
                builder: (context, isLoading, child) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        controller: registerData.password2Controller,
                        obscureText: registerData.confirm2Password.value,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  registerData.confirm2Password.value =
                                      !registerData.confirm2Password.value;
                                },
                                icon: Icon(registerData.confirm2Password.value
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                            prefixIcon: const Icon(Icons.lock_outline_rounded),
                            hintText: 'Confirm Password'),
                        validator: (value) => validationMatchingPassword(
                            value, registerData.passwordController),
                      ));
                },
              ),
            ]),
          ),
          const SizedBox(
            height: 120,
          ),
          ValueListenableBuilder<bool>(
              valueListenable: registerData.isLoading,
              builder: (context, isLoading, child) {
                return SizedBox(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    onPressed: registerData.isLoading.value
                        ? null
                        : () async {
                            FocusScope.of(context).unfocus();
                            FocusScope.of(context).requestFocus(FocusNode());
                            await registerData.onSaveStudentController(
                                context, mounted);
                          },
                    child: registerData.isLoading.value
                        ? const CircularProgressIndicator()
                        : const Text(
                            "Register Student",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                  ),
                );
              }),
        ]),
      ),
    );
  }
}
