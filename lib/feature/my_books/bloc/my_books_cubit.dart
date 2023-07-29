import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/my_books_repository.dart';

part 'my_books_state.dart';

class MyBooksCubit extends Cubit<MyBooksState> {
  MyBooksRepository myBooksRepository;

  MyBooksCubit({required this.myBooksRepository}) : super(MyBooksInitial()) {
    myBooksRepository.myBooksState.listen((even) {
      if(even == LoadingStateEnum.loading) emit(MyBooksLoadingState());
      if(even == LoadingStateEnum.fail) emit(MyBooksFailState());
      if(even == LoadingStateEnum.success) emit(MyBooksSuccessState());
    });
  }
}
