import 'package:bloc/bloc.dart';

import '../data/app_repository.dart';
import '../feature/home/data/homa_repository.dart';
import '../feature/my_books/data/my_books_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final AppRepository _appRepository;
  final MyBooksRepository myBooksRepository;
  final HomeRepository homeRepository;

  AppCubit(
      {required AppRepository appRepository,
      required this.myBooksRepository,
      required this.homeRepository})
      : _appRepository = appRepository,
        super(AppInitial()) {
    _appRepository.checkLogin();
    _appRepository.appState.stream.listen((event) {
      if (event == AppStateEnum.auth) {
        myBooksRepository.initial();
        homeRepository.isSecondScreen = false;
        emit(AppAuthState());
      }
      if (event == AppStateEnum.unAuth) {
        myBooksRepository.clearWardrobe();
        emit(AppUnAuthState());
      }
    });
  }
}
