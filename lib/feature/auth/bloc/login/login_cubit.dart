import 'package:bloc/bloc.dart';

import '../../../../data/app_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AppRepository _appRepository;

  LoginCubit({required AppRepository appRepository})
      : _appRepository = appRepository,
        super(LoginInitial());

  void login({required String email, required String code}) async {
    emit(LoginLoadingState());
    try {
      _appRepository.login(email, int.parse(code));
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginFailState(message: e.toString()));
    }
  }
}
