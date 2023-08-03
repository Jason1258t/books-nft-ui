class Details {
  final int ISBN;
  final String createAt;
  final String language;
  final String genre;
  final int pagesCount;
  final String collectionId;

  Details(this.ISBN, this.createAt, this.language, this.genre, this.pagesCount,
      this.collectionId);

  Details.fromJson(Map<String, dynamic> json)
      : ISBN = json['details']['ISBN'],
        createAt = json['details']['publicationDate'],
        language = json['details']['language'],
        genre = json['details']['genre'],
        collectionId = json['id'],
        pagesCount = json['details']['pagesCount'];
}
