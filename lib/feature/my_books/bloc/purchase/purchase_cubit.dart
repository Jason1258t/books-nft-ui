import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/my_books_repository.dart';

part 'purchase_state.dart';

class PurchaseCubit extends Cubit<PurchaseState> {
  final MyBooksRepository myBooksRepository;

  PurchaseCubit({required this.myBooksRepository}) : super(PurchaseInitial());

  void buyPlace(String shelfId) async {
    emit(PurchaseLoading());
    try {
      await myBooksRepository.buyPlace(shelfId);
      emit(PurchaseSuccess());
    } catch (e) {
      emit(PurchaseFail());
      rethrow;
    }
  }

  void buyShelf() async {
    emit(PurchaseLoading());
    try {
      await myBooksRepository.buyShelf();
      emit(PurchaseSuccess());
    } catch (e) {
      emit(PurchaseFail());
      rethrow;
    }
  }
}
