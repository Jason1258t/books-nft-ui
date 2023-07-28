import 'package:bloc/bloc.dart';

import '../data/app_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final AppRepository _appRepository;

  AppCubit({required AppRepository appRepository})
      : _appRepository = appRepository,
        super(AppInitial()) {
    _appRepository.checkLogin();
    _appRepository.appState.stream.listen((event) {
      if (event == AppStateEnum.auth) emit(AppAuthState());
      if (event == AppStateEnum.unAuth) emit(AppUnAuthState());
    });
  }
}
