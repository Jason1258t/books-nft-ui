import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/app_repository.dart';

part 'code_state.dart';

class CodeCubit extends Cubit<CodeState> {
  final AppRepository _appRepository;

  CodeCubit({required AppRepository appRepository})
      : _appRepository = appRepository,
        super(CodeInitial());

  // void wait() async {
  //   emit(WaitState(remainingTime: 60));
  //   //Duration timerDuration = const Duration(seconds: 60);
  //   int time = 60;
  //   Duration period = const Duration(seconds: 1);
  //   Timer _timer = Timer.periodic(period, (timer) {
  //     if (time <= 0) {
  //       timer.cancel();
  //     } else {
  //       time--;
  //       emit(WaitState(remainingTime: time));
  //     }
  //   });
  //
  //   emit(ReadyToSend());
  // }

  void signupCode(String email) async {
    try {
      _appRepository.getCodeOnSignUp(email);
      emit(SentState());
    } catch (e) {
      emit(FailState());
    }
  }

  void loginCode(String email) async {
    try {
      _appRepository.getCode(email);
      emit(SentState());
    } catch (e) {
      emit(FailState());
    }
  }
}
