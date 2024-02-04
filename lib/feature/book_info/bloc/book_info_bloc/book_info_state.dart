part of 'book_info_cubit.dart';

@immutable
abstract class BookInfoState {}

class BookInfoInitial extends BookInfoState {}

class BookInfoSuccess extends BookInfoState {}

class BookInfoLoading extends BookInfoState {}

class BookInfoFail extends BookInfoState {}
