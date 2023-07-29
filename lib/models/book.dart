part of 'shelf.dart';

abstract class ShelfPlaceData {}

class Book implements ShelfPlaceData{
  final String bookId;
  final String name;
  final String image;
  final String description;
  final String ISBN;
  final String createAt;
  final String language;
  final String genre;
  final int pagesCount;
  final bool owned;
  final bool available;
  final int intelegenceInc;
  final int energyInc;
  final int strengthInc;
  final int luckInc;

  Book({
    this.owned = false,
    this.bookId = '',
    this.intelegenceInc = 5,
    this.energyInc = 4,
    this.strengthInc = 4,
    this.luckInc = 6,
    this.description = '',
    this.createAt = '',
    this.genre = '',
    this.ISBN = '',
    this.language = '',
    this.pagesCount = 500,
    this.available = true,
    required this.name,
    required this.image,
  });

  Book.fromJson(Map<String, dynamic> json, bool isOwned,
      {this.available = true})
      : owned = isOwned,
        bookId = json['id'],
        name = json['bookInfo']['title'],
        image = '',
        description = json['bookInfo']['description'],
        ISBN = json['details']['ISBN'],
        createAt = json['details']['publicationDate'],
        language = json['details']['language'],
        genre = json['details']['genre'],
        pagesCount = json['details']['pagesCount'],
        intelegenceInc = json['intelegenceInc'],
        energyInc = json['energyInc'],
        strengthInc = json['strengthInc'],
        luckInc = json['luckInc'];
}
