import 'package:nft/models/collection_view.dart';

class BooksGenre {
  final String name;
  final List<CollectionView> collections;

  BooksGenre({required this.name, required this.collections});

  BooksGenre.fromJson(List<dynamic> json, this.name)
      : collections = json
            .map((e) => CollectionView.fromJson(e))
            .toList();
}
