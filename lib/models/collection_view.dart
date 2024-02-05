class CollectionView {
  final int collection_id;
  final String cover_url;
  final String name;
  final String author;

  CollectionView(this.collection_id, this.cover_url,
      this.name, this.author);

  CollectionView.fromJson(Map<String, dynamic> json)
      : collection_id = json['collection_id'],
        cover_url = json['cover_url'],
        name = json['name'],
        author = json['author'];
}
