import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nft/feature/my_books/data/my_books_repository.dart';

import '../data/store_repository.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreRepository storeRepository;
  MyBooksRepository myBooksRepository;

  StoreCubit({required this.storeRepository, required this.myBooksRepository})
      : super(StoreInitial()) {
    storeRepository.saleCollectionState.listen((event) {
      if (event == LoadingStateEnum.loading) emit(StoreLoadingState());
      if (event == LoadingStateEnum.fail) emit(StoreFailState());
      if (event == LoadingStateEnum.success) emit(StoreSuccessState());
    });
  }

  void buyBook(String collectionId) async {
    await storeRepository.buyCollection(collectionId);
    await myBooksRepository.getWardrobe();
  }
}
