import 'package:bloc/bloc.dart';

import '../data/app_repository.dart';
import '../feature/my_books/data/my_books_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final AppRepository _appRepository;
  final MyBooksRepository myBooksRepository;

  AppCubit(
      {required AppRepository appRepository, required this.myBooksRepository})
      : _appRepository = appRepository,
        super(AppInitial()) {
    _appRepository.checkLogin();
    _appRepository.appState.stream.listen((event) {
      if (event == AppStateEnum.auth) {
        myBooksRepository.initial();
        emit(AppAuthState());
      }
      if (event == AppStateEnum.unAuth) emit(AppUnAuthState());
    });
  }
}
