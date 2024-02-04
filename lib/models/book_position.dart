import 'package:nft/models/shelf.dart';


class BookPosition implements ShelfPlaceData{
  final String shelf;
  final int index;

  BookPosition({required this.shelf, required this.index});

  Map<String, dynamic> get toJson => {'shelf': shelf, 'index': index};
}
