part of 'code_cubit.dart';

@immutable
abstract class CodeState {}

class CodeInitial extends CodeState {}

class SendingState extends CodeState {}

class FailState extends CodeState {}

class SentState extends CodeState {}

/// На случвй если будем делать задержку с таймером перед повторной отпрвкой
class WaitState extends CodeState {
  final int remainingTime;

  WaitState({required this.remainingTime});
}

class ReadyToSend extends CodeState {}


