import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base_page.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widget/button_widget.dart';
import 'login_controller.dart';
import '../../../../core/utils/strings_ext.dart';

class LoginPage extends BasePage<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(42),
          width: 400,
          child: Obx(
            () => Form(
              key: controller.formKey,
              autovalidateMode:
                  controller.autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: Image.asset('${ImagePath.base}logo.png'),
                  ),
                  const SizedBox(height: 30.0),
                  Center(
                    child: Text(
                      'Admin Panel',
                      style: Get.textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 48.0),
                  _emailField,
                  const SizedBox(height: 8.0),
                  _passwordField,
                  const SizedBox(height: 24.0),
                  SizedBox(
                    width: Get.width,
                    child: LoadingViewButton(
                      text: 'Login',
                      onPressed: controller.onLogin,
                      isLoading: controller.loadingData,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get _emailField => TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        controller: controller.emailController,
        validator: (input) => input.isValidEmail() ? null : 'Invalid Email address',
        style: Get.textTheme.bodyMedium,
        decoration: const InputDecoration(
          labelText: 'Email',
          prefixIcon: Icon(
            Icons.email,
            size: 18,
          ),
        ),
      );

  Widget get _passwordField => TextFormField(
        autofocus: false,
        obscureText: true,
        controller: controller.passwordController,
        validator: (input) => input.isNotNullOrEmpty() ? null : 'Password cannot be empty',
        style: Get.textTheme.bodyMedium,
        decoration: const InputDecoration(
          labelText: 'Password',
          prefixIcon: Icon(
            Icons.password,
            size: 18,
          ),
        ),
      );
}
