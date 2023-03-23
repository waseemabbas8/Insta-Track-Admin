import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base_page.dart';
import '../../../../core/data/response.dart';
import '../../../../core/route/app_routes.dart';
import '../../domain/usecase/login.dart';

class LoginController extends BaseController {
  final LoginUseCase login;

  LoginController({required this.login});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxBool _autoValidate = false.obs;

  get autoValidate => _autoValidate.value;

  set autoValidate(value) => _autoValidate.value = value;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    emailController.text = 'admin@admin.com';
    passwordController.text = '123456';
    super.onInit();
  }

  void onLogin() async {
    if (formKey.currentState?.validate() == false) return;
    setLoadingState(true);
    final result = await login(
      params: LoginParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    if (result is SuccessResult) {
      replaceRoute(AppRoutes.home);
    } else {
      showMessage(message: (result as ErrorResult).e.toString());
    }
    setLoadingState(false);
  }
}
