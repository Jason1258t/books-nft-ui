class Details {
  final int ISBN;
  final String createAt;
  final String language;
  final String genre;
  final int pagesCount;
  final String description;

  Details(this.ISBN, this.createAt, this.language, this.genre, this.pagesCount,
      this.description);

  Details.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        ISBN = json['details']['ISBN'],
        createAt = json['details']['publicationDate'],
        language = json['details']['language'],
        genre = json['details']['genre'],
        pagesCount = json['details']['pagesCount'];
}
