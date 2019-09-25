import 'package:flutter/cupertino.dart';
import 'package:random_phrases_redux/redux/state/favorite_phrases_list_state.dart';
import 'package:random_phrases_redux/redux/state/initial_phrase_state.dart';
import 'package:random_phrases_redux/redux/state/loading_state.dart';
import 'package:random_phrases_redux/redux/state/random_phrases_list_state.dart';

class AppState {
  final FavoritePhrasesListState favoritePhrasesListState;
  final InitialPhraseState initialPhraseState;
  final RandomPhrasesListState randomPhrasesListState;
  final LoadingState loadingState;

  AppState(
      {@required this.favoritePhrasesListState,
      @required this.initialPhraseState,
      @required this.randomPhrasesListState,
      @required this.loadingState});

  AppState copyWith(
      {FavoritePhrasesListState favoritePhrasesListState,
      InitialPhraseState initialPhraseState,
      RandomPhrasesListState randomPhrasesListState,
      LoadingState loadingState}) {
    return AppState(
        favoritePhrasesListState:
            favoritePhrasesListState ?? this.favoritePhrasesListState,
        initialPhraseState: initialPhraseState ?? this.initialPhraseState,
        randomPhrasesListState:
            randomPhrasesListState ?? this.randomPhrasesListState,
        loadingState: loadingState ?? this.loadingState);
  }

  factory AppState.initial() {
    return AppState(
        randomPhrasesListState: RandomPhrasesListState.initial(),
        initialPhraseState: InitialPhraseState.initial(),
        favoritePhrasesListState: FavoritePhrasesListState.initial(),
        loadingState: LoadingState.initial());
  }

  toJson() => {
        "favoritePhrasesListState": favoritePhrasesListState.toJson(),
      };

  static AppState fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return AppState.initial();
    } else {
      return AppState(
          favoritePhrasesListState: FavoritePhrasesListState.fromJson(
              json["favoritePhrasesListState"]),
          randomPhrasesListState: RandomPhrasesListState.initial(),
          initialPhraseState: InitialPhraseState.initial(),
          loadingState: LoadingState.initial());
    }
  }
}
