class QuotesModel {
  int id;
  String author;
  String quote;

  QuotesModel({required this.id, required this.author, required this.quote});

  factory QuotesModel.fromJson(Map<String, dynamic> json) {
    return QuotesModel(
        id: json["id"], author: json["author"], quote: json["quote"]);
  }
}

class QuotesDataModel {
  int total;
  int skip;
  int limit;
  List<QuotesModel> quotes;

  QuotesDataModel(
      {required this.total,
      required this.skip,
      required this.limit,
      required this.quotes});

  factory QuotesDataModel.fromJson(Map<String, dynamic> json) {
    List<QuotesModel> mQuotes = [];

    for (Map<String, dynamic> eachQuote in json["quotes"]) {
      QuotesModel eachModel = QuotesModel.fromJson(eachQuote);
      mQuotes.add(eachModel);
    }

    return QuotesDataModel(
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
        quotes: mQuotes);
  }
}
