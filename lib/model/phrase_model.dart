class PhraseModel {
  String quote;
  String author;

  PhraseModel(this.quote, this.author);

  dynamic toJson() => {
    "quote": quote,
    "author": author
  };

  static PhraseModel fromJson(dynamic json) =>
      PhraseModel(json["quote"], json["author"]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PhraseModel &&
              runtimeType == other.runtimeType &&
              quote == other.quote &&
              author == other.author;

  @override
  int get hashCode =>
      quote.hashCode ^
      author.hashCode;

  @override
  String toString() {
    return 'PhraseModel{quote: $quote, author: $author}';
  }

}