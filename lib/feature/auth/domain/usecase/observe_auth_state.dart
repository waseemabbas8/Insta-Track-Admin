import '../../../../core/data/use_case.dart';
import '../model/auth_state.dart';
import '../repository/user_repository.dart';

abstract class ObserveAuthStateUseCase extends ObservableUseCase<AuthState, NoParams> {}

class ObserveAuthStateUseCaseImpl extends ObserveAuthStateUseCase {
  final UserRepository repo;

  ObserveAuthStateUseCaseImpl({required this.repo});

  @override
  Stream<AuthState> call({required NoParams params}) => repo.authSate;
}