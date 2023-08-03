import 'package:nft/models/details.dart';

class Collection {
  final String title;
  final String author;
  final int commonPercent;
  final int silverPercent;
  final int goldPercent;
  final String description;
  final Details details;
  final String id;

  Collection.fromJson(Map<String, dynamic> json)
      : title = json['bookInfo']['title'],
        author = json['bookInfo']['author'],
        commonPercent = json['commonPercentage'],
        silverPercent = json['silverPercentage'],
        goldPercent = json['goldPercentage'],
        description = json['bookInfo']['description'],
        details = Details.fromJson(json['details']),
        id = json['id'];
}
