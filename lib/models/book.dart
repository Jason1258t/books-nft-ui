part of 'shelf.dart';

abstract class ShelfPlaceData {}

class Book implements ShelfPlaceData {
  final String id;
  final String name;
  final String image;
  final String spine;
  final String description;

  final int intelegenceInc;
  final int energyInc;
  final int strengthInc;
  final int luckInc;
  final Details details;
  final String type;

  final bool owned;
  bool available;

  Book(
    this.type, {
    this.owned = false,
    this.id = '',
    this.intelegenceInc = 5,
    this.energyInc = 4,
    this.strengthInc = 4,
    this.luckInc = 6,
    this.description = '',
    this.available = true,
    this.spine = '',
    required this.details,
    required this.name,
    required this.image,
  });

  Book.fromJson(Map<String, dynamic> json, bool isOwned,
      {this.available = true})
      : owned = isOwned,
        id = json['id'],
        type = json['type'],
        name = json['bookInfo']['title'],
        image = json['covers'][0]['url'],
        spine = json['covers'][0]['spine'] ?? json['covers'][0]['url'],
        description = json['bookInfo']['description'],
        intelegenceInc = json['intelegenceInc'],
        energyInc = json['energyInc'],
        strengthInc = json['strengthInc'],
        details = Details.fromJson(json),
        luckInc = json['luckInc'] {
    assert(['common', 'silver', 'gold'].contains(type),
        'type parse error: type $type');
  }
}
