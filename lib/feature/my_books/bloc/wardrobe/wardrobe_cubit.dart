import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/my_books_repository.dart';

part 'wardrobe_state.dart';

class WardrobeCubit extends Cubit<WardrobeState> {
  MyBooksRepository myBooksRepository;

  WardrobeCubit({required this.myBooksRepository}) : super(WardrobeInitial()) {
    myBooksRepository.wardrobeState.listen((event) {
      if (event == LoadingStateEnum.fail) emit(WardrobeFailState());
      if (event == LoadingStateEnum.loading) emit(WardrobeLoadingState());
      if (event == LoadingStateEnum.success) emit(WardrobeSuccessState());
    });
  }
}
