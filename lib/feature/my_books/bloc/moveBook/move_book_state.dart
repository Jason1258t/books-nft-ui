part of 'move_book_cubit.dart';

@immutable
abstract class MoveBookState {}

class MoveBookInitial extends MoveBookState {}

class MoveBookLoadingState extends MoveBookState {}

class MoveBookFailState extends MoveBookState {}

class MoveBookSuccessState extends MoveBookState {}
