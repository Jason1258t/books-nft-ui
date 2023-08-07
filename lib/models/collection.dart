import 'package:nft/models/details.dart';
part 'books_genre.dart';

class Collection {
  final String id;
  final String name;
  final String author;
  final int commonPercent;
  final int silverPercent;
  final int goldPercent;
  final String description;
  final Details details;
  final String image;
  final int availableBooks;
  final int maxBooks;

  Collection.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['bookInfo']['title'],
        author = json['bookInfo']['author'],
        image = json['covers'][0]['url'],
        commonPercent = json['commonPercentage'],
        silverPercent = json['silverPercentage'],
        goldPercent = json['goldPercentage'],
        description = json['bookInfo']['description'],
        details = Details.fromJson(json),
        availableBooks = json['availableBooks'],
        maxBooks = json['booksCount'];
}
