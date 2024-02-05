import 'package:nft/feature/my_books/data/my_books_repository.dart';
import 'package:nft/models/book_details.dart';
import 'package:nft/models/shelf.dart';
import 'package:nft/services/api_service/api_service.dart';
import 'package:rxdart/rxdart.dart';

class BookInfoRepository {
  final ApiService _apiService;

  BookInfoRepository({required ApiService apiService})
      : _apiService = apiService;

  Book? currentBook;
  BookDetails? currentBookDetails;

  BehaviorSubject<LoadingStateEnum> bookInfoState =
      BehaviorSubject<LoadingStateEnum>.seeded(LoadingStateEnum.loading);

  BehaviorSubject<LoadingStateEnum> bookDetailState =
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

  Future getBookDetailsById(int id) async {
    bookDetailState.add(LoadingStateEnum.loading);
    try {
      final data = await _apiService.books.getBookDetails(id);
      print(data);

      currentBookDetails =
          BookDetails.fromJson(data);
      bookDetailState.add(LoadingStateEnum.success);
    }
    catch (e){
      bookDetailState.add(LoadingStateEnum.fail);
    }
  }
}
