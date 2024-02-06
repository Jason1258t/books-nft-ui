import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nft/feature/my_books/data/my_books_repository.dart';
import 'package:nft/feature/store/data/store_repository.dart';

part 'genres_state.dart';

class GenresCubit extends Cubit<GenresState> {
  final StoreRepository storeRepository;
  
  GenresCubit({required this.storeRepository}) : super(GenresInitial()){
    storeRepository.booksGenreStream.listen((event) {
      if (event == LoadingStateEnum.loading) emit(GenresLoadingState());
      if (event == LoadingStateEnum.fail) emit(GenresFailState());
      if (event == LoadingStateEnum.success) emit(GenresSuccessState());});
  }
}
