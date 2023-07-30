import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nft/feature/my_books/data/my_books_repository.dart';

import '../data/storeRepository.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreRepository appRepository;

  StoreCubit({required this.appRepository}) : super(StoreInitial()){
    appRepository.saleBooksState.listen((event) {
      if(event == LoadingStateEnum.loading) emit(StoreLoadingState());
      if(event == LoadingStateEnum.fail) emit(StoreFailState());
      if(event == LoadingStateEnum.success) emit(StoreSuccessState());
    });
  }
}
