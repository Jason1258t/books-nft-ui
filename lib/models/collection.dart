import 'package:nft/models/traits_collection.dart';


class Collection {
  final int collectionId;
  final String name;
  final String author;
  final int bronzePercent;
  final int silverPercent;
  final int goldPercent;
  final String coverUrl;
  final int percent;
  final int price;
  final String creator;
  final String tag;
  final TraitsCollection traitsCollection;

  Collection.fromJson(Map<String, dynamic> json)
      : collectionId = json['collection_id'],
        name = json['name'],
        author = json['author'],
        coverUrl = json['cover_url'],
        percent = json['percent'],
        price = json['price'],
        creator = json['creator'],
        bronzePercent = json['rates'][0],
        silverPercent = json['rates'][1],
        goldPercent = json['rates'][2],
        tag = json['tags'][0],
        traitsCollection = TraitsCollection.fromJson(json['traits']);
}
