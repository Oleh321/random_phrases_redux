import 'package:flutter/cupertino.dart';
import 'package:random_phrases_redux/model/phrase_model.dart';

class InitialPhraseState {
  PhraseModel phraseModel;

  InitialPhraseState({@required this.phraseModel});

  static InitialPhraseState fromJson(dynamic json) =>
      InitialPhraseState(phraseModel: PhraseModel.fromJson(json));

  dynamic toJson() => {"phraseModel" : phraseModel.toJson()};

  factory InitialPhraseState.initial() =>
      InitialPhraseState(phraseModel: PhraseModel("",""));
}