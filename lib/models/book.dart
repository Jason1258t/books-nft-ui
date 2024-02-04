part of 'shelf.dart';

abstract class ShelfPlaceData {}

class Book implements ShelfPlaceData {
  final int book_id;
  final int collection_id;
  final String name;
  final String author;
  final String cover_url;
  final String rare;
  final String creator;

  final int token_id;
  final int total_supply;
  final int brain;
  final int shield;
  final int energy;
  final int luck;
  final int activities;
  final int income;
  final int current_images;
  final int max_images;

  final bool owned;
  final bool on_shelf;

  Book({
    required this.token_id,
    required this.total_supply,
    required this.brain,
    required this.shield,
    required this.energy,
    required this.luck,
    required this.activities,
    required this.income,
    required this.current_images,
    required this.max_images,
    required this.collection_id,
    required this.creator,
    required this.on_shelf,
    required this.rare,
    required this.author,
    this.owned = false,
    this.book_id = 0,
    required this.name,
    required this.cover_url,
  });

  Book.fromJson(Map<String, dynamic> json, bool isOwned)
      : owned = isOwned,
        book_id = json['book_id'],
        rare = json['rare'],
        name = json['name'],
        author = json['author'],
        cover_url = json['cover_url'],
        token_id = json['stats']['token_id'],
        total_supply = json['stats']['total_supply'],
        brain = json['stats']['brain'],
        shield = json['stats']['shield'],
        energy = json['stats']['energy'],
        luck = json['stats']['luck'],
        activities = json['stats']['activities'],
        income = json['stats']['income'],
        max_images = json['stats']['max_images'],
        current_images = json['stats']['current_images'],
        collection_id = json['collection_id'],
        creator = json['creator'],
        on_shelf = json['on_shelf']{
    assert(['common', 'silver', 'gold'].contains(rare),
        'type parse error: type $rare');
  }
}
