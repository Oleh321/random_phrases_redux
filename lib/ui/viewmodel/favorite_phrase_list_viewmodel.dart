import 'package:flutter/material.dart';
import 'package:random_phrases_redux/model/phrase_model.dart';
import 'package:random_phrases_redux/model/screen.dart';
import 'package:random_phrases_redux/redux/action/favorites_action.dart';
import 'package:random_phrases_redux/redux/state/app_state.dart';
import 'package:random_phrases_redux/ui/phrase_item.dart';
import 'package:redux/redux.dart';

class FavoritePhraseListViewModel {
  static const Screen screen = Screen.FAVORITES;

  final List<PhraseModel> phrasesList;
  final Function(PhraseModel) removeFromFavorites;

  FavoritePhraseListViewModel(this.phrasesList, this.removeFromFavorites);

  static FavoritePhraseListViewModel fromStore(Store<AppState> store) {
    return FavoritePhraseListViewModel(
        store.state.favoritePhrasesListState.favoriteList,
        (phrase) => store.dispatch(RemoveFromFavoritesAction(phrase)));
  }

  PhraseItemViewModel getItem(int index) {
    return PhraseItemViewModel(
        phrase: phrasesList[index],
        favoriteButtonCallback: (phrase) => removeFromFavorites(phrase),
        favoriteButtonBackground: Colors.red,
        favoriteButtonForeground: Colors.white,
        favoriteButtonText: "Remove from favorites");
  }
}
