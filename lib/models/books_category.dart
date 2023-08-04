part of 'collection.dart';

class BooksGenre {
  final String name;
  final List<Collection> collections;

  BooksGenre({required this.name, required this.collections});

  BooksGenre.fromJson(Map<String, dynamic> json)
      : name = json['genre'],
        collections = (json['collections'] as List)
            .map((e) => Collection.fromJson(e))
            .toList();
}
