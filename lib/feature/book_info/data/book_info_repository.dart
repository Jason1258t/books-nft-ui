import 'package:nft/feature/my_books/data/my_books_repository.dart';
import 'package:nft/models/shelf.dart';
import 'package:nft/services/api_service/api_service.dart';
import 'package:rxdart/rxdart.dart';

class BookInfoRepository {
  final ApiService _apiService;

  BookInfoRepository({required ApiService apiService})
      : _apiService = apiService;

  Book? currentBook;

  BehaviorSubject<LoadingStateEnum> bookInfoState =
      BehaviorSubject<LoadingStateEnum>.seeded(LoadingStateEnum.loading);

  Future getBookInfoById(int id) async {
    bookInfoState.add(LoadingStateEnum.loading);
    try {
      final data = await _apiService.books.getBookInfo(id);
      print(data);

      currentBook =
          Book.fromJson(data, true);
      bookInfoState.add(LoadingStateEnum.success);
    }
    catch (e){
      bookInfoState.add(LoadingStateEnum.fail);
    }
  }
}
