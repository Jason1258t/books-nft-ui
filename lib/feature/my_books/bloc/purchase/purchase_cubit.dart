import 'package:bloc/bloc.dart';

import '../../../store/data/store_repository.dart';
import '../../data/my_books_repository.dart';

part 'purchase_state.dart';

class PurchaseCubit extends Cubit<PurchaseState> {
  final MyBooksRepository myBooksRepository;
  final StoreRepository storeRepository;

  PurchaseCubit({required this.myBooksRepository, required this.storeRepository}) : super(PurchaseInitial());

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


  void buyBook(int collectionId) async {
    emit(PurchaseLoading());
    try {
      await storeRepository.buyCollectionById(collectionId);
      await storeRepository.getStoreCollections();
      emit(PurchaseSuccess());
    } catch (e) {
      emit(PurchaseFail());
      rethrow;
    }
  }
}
