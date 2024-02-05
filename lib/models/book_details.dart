class BookDetails {
  final String ISBN;
  final String createAt;
  final String language;
  final String genre;
  final int pagesCount;
  final String description;
  final String contractAddress;

  BookDetails(this.ISBN, this.createAt, this.language, this.genre, this.pagesCount,
      this.description, this.contractAddress);

  BookDetails.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        ISBN = json['details']['isbn'],
        createAt = json['details']['publish_date'],
        language = json['details']['language'],
        genre = json['details']['genre'],
        pagesCount = json['details']['page_count'],
        contractAddress = json['details']['contract_address']
  ;
}
