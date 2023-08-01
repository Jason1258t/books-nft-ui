import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../../../data/app_repository.dart';

part 'code_state.dart';

class CodeCubit extends Cubit<CodeState> {
  final AppRepository _appRepository;

  CodeCubit({required AppRepository appRepository})
      : _appRepository = appRepository,
        super(CodeInitial());

  /// Для того чтоб потом сделть таймер до повторной отправки
  void _wait() async {
    emit(WaitState(remainingTime: 60));
    //Duration timerDuration = const Duration(seconds: 60);
    int time = 61;
    Duration period = const Duration(seconds: 1);
    Timer.periodic(period, (timer) {
      if (time <= 0) {
        emit(ReadyToSend());
        timer.cancel();
      } else {
        time--;
        emit(WaitState(remainingTime: time));
      }
    });
  }

  void signupCode(String email) async {
    emit(SendingState());
    try {
      log('--------- trying to send step 3');
      await _appRepository.getCodeOnSignUp(email);
      emit(SentState());
      _wait();
    } catch (e) {
      emit(FailState());
      rethrow;
    }
  }

  void loginCode(String email) async {
    emit(SendingState());
    try {
      log('--------- trying to send step 3');
      await _appRepository.getCode(email);
      emit(SentState());
      _wait();
    } catch (e) {
      emit(FailState());
      rethrow;
    }
  }
}
