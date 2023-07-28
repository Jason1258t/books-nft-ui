class Book {
  final String name;
  final String image;
  final String description;
  final String ISBN;
  final String createAt;
  final String language;
  final String genre;
  final int pagesCount;
  final bool owned;

  Book({
    this.description = 'ывлаплыовраплорывалопрывлоарплывраплоырвлапорывлапор',
    this.createAt ='',
    this.genre = '',
    this.ISBN = '',
    this.language = '',
    this.pagesCount = 500,
    required this.name,
    required this.image,
    required this.owned,
  });
}
