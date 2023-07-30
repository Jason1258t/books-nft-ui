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
      emit(PurchaseSuccess(buyType: BuyType.place));
    } catch (e) {
      emit(PurchaseFail());
      rethrow;
    }
  }

  void buyShelf() async {
    emit(PurchaseLoading());
    try {
      await myBooksRepository.buyShelf();
      emit(PurchaseSuccess(buyType: BuyType.shelf));
    } catch (e) {
      emit(PurchaseFail());
      rethrow;
    }
  }


  void buyBook(String bookId) async {
    emit(PurchaseLoading());
    try {
      await myBooksRepository.buyBook(bookId);
      emit(PurchaseSuccess(buyType: BuyType.book, buyId: bookId));
    } catch (e) {
      emit(PurchaseFail());
      rethrow;
    }
  }
}
