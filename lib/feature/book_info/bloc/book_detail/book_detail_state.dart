part of 'book_detail_cubit.dart';

@immutable
abstract class BookDetailState {}

class BookDetailInitial extends BookDetailState {}

class BookDetailSuccess extends BookDetailState {}

class BookDetailLoading extends BookDetailState {}

class BookDetailFail extends BookDetailState {}
