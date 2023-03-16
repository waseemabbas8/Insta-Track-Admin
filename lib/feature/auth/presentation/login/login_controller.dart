import '../../../../core/base_page.dart';
import '../../../../core/data/response.dart';
import '../../../../core/route/app_routes.dart';
import '../../domain/usecase/login.dart';

class LoginController extends BaseController {
  final LoginUseCase login;

  LoginController({required this.login});

  void onLogin() async {
    final result = await login(params: LoginParams(email: "test@test.com", password: "123456"));
    if(result is SuccessResult) {
      replaceRoute(AppRoutes.root);
    } else {
      showMessage(message: (result as ErrorResult).e.toString());
    }
  }

}