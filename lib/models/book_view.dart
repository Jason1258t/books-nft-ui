class BookView {
  final int book_id;
  final int collection_id;
  final int percent;
  final String cover_url;
  final String name;
  final String author;
  final String rare;

  BookView(this.book_id, this.collection_id, this.percent, this.cover_url,
      this.name, this.author, this.rare);

  BookView.fromJson(Map<String, dynamic> json)
      : book_id = json['book_id'],
        collection_id = json['collection_id'],
        percent = json['percent'],
        cover_url = json['cover_url'],
        name = json['name'],
        author = json['author'],
        rare = json['rare'];
}
