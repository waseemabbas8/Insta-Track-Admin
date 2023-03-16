import '../../core/base_page.dart';
import '../../core/data/use_case.dart';
import '../../core/route/app_routes.dart';
import '../auth/domain/model/auth_state.dart';
import '../auth/domain/usecase/observe_auth_state.dart';

class RootController extends BaseController {
  final ObserveAuthStateUseCase observeAuthState;

  RootController({required this.observeAuthState});

  @override
  void onInit() {
    _fetchAuthState();
    super.onInit();
  }

  void _fetchAuthState() {
    setLoadingState(true);
    observeAuthState(params: NoParams.getInstance()).listen((authState) {
      setLoadingState(false);
      if(authState == AuthState.signedIn) {
        replaceRoute(AppRoutes.home);
      } else {
        replaceRoute(AppRoutes.login);
      }
    });
  }

}