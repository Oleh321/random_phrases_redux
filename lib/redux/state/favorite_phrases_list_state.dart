import 'package:random_phrases_redux/model/phrase_model.dart';

class FavoritePhrasesListState {
  List<PhraseModel> favoriteList;

  FavoritePhrasesListState({this.favoriteList});

  static FavoritePhrasesListState fromJson(dynamic json) {
    List<PhraseModel> list = [];
    json["favoriteList"].forEach((el) => list.add(PhraseModel.fromJson(el)));
    return FavoritePhrasesListState(favoriteList: list);
  }

  Map toJson() => {"favoriteList": favoriteList};

  static FavoritePhrasesListState initial() =>
      FavoritePhrasesListState(favoriteList: []);
}
