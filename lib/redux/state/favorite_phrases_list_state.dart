import 'package:random_phrases_redux/model/phrase_model.dart';

class FavoritePhrasesListState {
  List<PhraseModel> favoriteList;

  FavoritePhrasesListState({this.favoriteList});

  static FavoritePhrasesListState fromJson(dynamic json) =>
      json.map((el) => PhraseModel(el.quote, el.author));

  dynamic toJson() => {"favoriteList": favoriteList};

  factory FavoritePhrasesListState.initial() =>
      FavoritePhrasesListState(favoriteList: []);
}
