import 'package:bloc/bloc.dart';
import 'package:nft/feature/book_info/bloc/collection_info/collection_info_state.dart';
import 'package:nft/feature/store/data/store_repository.dart';

import '../../../my_books/data/my_books_repository.dart';

class CollectionInfoCubit extends Cubit<CollectionInfoState> {
  final StoreRepository storeRepository;
  
  CollectionInfoCubit({required this.storeRepository}) : super(CollectionInfoInitial()){
   storeRepository.collectionInfo.listen((event) {
     if(event == LoadingStateEnum.loading) emit(CollectionInfoLoading());
     if(event == LoadingStateEnum.fail) emit(CollectionInfoFail());
     if(event == LoadingStateEnum.success) emit(CollectionInfoSuccess());
   });
  }
}
