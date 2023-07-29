import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nft/feature/my_books/bloc/books/my_books_cubit.dart';

import '../../../../models/book_position.dart';
import '../../data/my_books_repository.dart';

part 'move_book_state.dart';

class MoveBookCubit extends Cubit<MoveBookState> {
  MyBooksRepository myBooksRepository;

  MoveBookCubit({required this.myBooksRepository}) : super(MoveBookInitial());

  void removeBook(String id) async{
    emit(MoveBookLoadingState());
    try{
      myBooksRepository.removeBook(id);
    }catch(e){
      emit(MoveBookFailState());
      rethrow;
    }
    emit(MoveBookSuccessState());
  }

  void putBook({BookPosition? position, required String id}) async{
    emit(MoveBookLoadingState());
    try{
      myBooksRepository.placeBook(position: position, id: id);
      emit(MoveBookSuccessState());
    }catch(e){
      emit(MoveBookFailState());
      rethrow;
    }
    emit(MoveBookSuccessState());
  }
}
