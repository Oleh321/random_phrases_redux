import 'package:random_phrases_redux/model/phrase_model.dart';

class RandomPhrasesListState {
  List<PhraseModel> randomPhrasesList;

  RandomPhrasesListState({this.randomPhrasesList});

  static RandomPhrasesListState fromJson(dynamic json) =>
      json["randomPhrasesList"].map((el) => PhraseModel(el.quote, el.author));

  dynamic toJson() => {"randomPhrasesList": randomPhrasesList};

  factory RandomPhrasesListState.initial() =>
      RandomPhrasesListState(randomPhrasesList: []);
}
