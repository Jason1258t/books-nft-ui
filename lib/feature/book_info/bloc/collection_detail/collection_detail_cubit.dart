import 'package:bloc/bloc.dart';
import 'package:nft/feature/book_info/bloc/collection_detail/collection_detail_state.dart';
import 'package:nft/feature/my_books/data/my_books_repository.dart';
import 'package:nft/feature/store/data/store_repository.dart';

class CollectionDetailCubit extends Cubit<CollectionDetailState> {
  final StoreRepository storeRepository;

  CollectionDetailCubit({required this.storeRepository})
      : super(CollectionDetailInitial()) {
    storeRepository.collectionDetail.listen((event) {
      if (event == LoadingStateEnum.loading) emit(CollectionDetailLoading());
      if (event == LoadingStateEnum.fail) emit(CollectionDetailFail());
      if (event == LoadingStateEnum.success) emit(CollectionDetailSuccess());
    });
  }
}
