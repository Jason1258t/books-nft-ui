import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nft/feature/book_info/data/book_info_repository.dart';
import 'package:nft/feature/my_books/data/my_books_repository.dart';

part 'book_info_state.dart';

class BookInfoCubit extends Cubit<BookInfoState> {
  final BookInfoRepository bookInfoRepository;

  BookInfoCubit({required this.bookInfoRepository}) : super(BookInfoInitial()){
    bookInfoRepository.bookInfoState.listen((even) {
      if(even == LoadingStateEnum.loading) emit(BookInfoLoading());
      if(even == LoadingStateEnum.fail) emit(BookInfoFail());
      if(even == LoadingStateEnum.success) emit(BookInfoSuccess());
    });
  }
}
