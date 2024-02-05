import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nft/feature/book_info/data/book_info_repository.dart';

import '../../../my_books/data/my_books_repository.dart';

part 'book_detail_state.dart';

class BookDetailCubit extends Cubit<BookDetailState> {
  final BookInfoRepository bookInfoRepository;

  BookDetailCubit({required this.bookInfoRepository})
      : super(BookDetailInitial()) {
    bookInfoRepository.bookDetailState.listen((event) {
      if (event == LoadingStateEnum.loading) emit(BookDetailLoading());
      if (event == LoadingStateEnum.fail) emit(BookDetailFail());
      if (event == LoadingStateEnum.success) emit(BookDetailSuccess());
    });
  }
}
