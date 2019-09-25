import 'package:flutter/material.dart';
import 'package:random_phrases_redux/model/phrase_model.dart';
import 'package:random_phrases_redux/model/screen.dart';
import 'package:random_phrases_redux/redux/action/favorites_action.dart';
import 'package:random_phrases_redux/redux/action/thunk/api_requests_thunk_actions.dart';
import 'package:random_phrases_redux/redux/state/app_state.dart';
import 'package:random_phrases_redux/ui/phrase_item.dart';
import 'package:redux/redux.dart';

class RandomPhraseListViewModel {
  static const Screen screen = Screen.RANDOM_LIST;

  final List<PhraseModel> phrasesList;
  final bool isLoading;

  final Function loadRandomList;
  final Function(PhraseModel) addToFavorites;
  final Function(PhraseModel) removeFromFavorites;
  final Function(PhraseModel) containElement;

  RandomPhraseListViewModel(
      {this.phrasesList,
      this.loadRandomList,
      this.isLoading,
      this.addToFavorites,
      this.removeFromFavorites,
      this.containElement});

  static RandomPhraseListViewModel fromStore(Store<AppState> store) {
    return RandomPhraseListViewModel(
        phrasesList: store.state.randomPhrasesListState.randomPhrasesList,
        isLoading: store.state.loadingState.isLoading,
        loadRandomList: () => store.dispatch(loadRandomPhrasesAction(screen)),
        addToFavorites: (phrase) =>
            store.dispatch(AddToFavoritesAction(phrase)),
        removeFromFavorites: (phrase) =>
            store.dispatch(RemoveFromFavoritesAction(phrase)),
        containElement: (phrase) =>
            store.state.favoritePhrasesListState.favoriteList.contains(phrase));
  }

  PhraseItemViewModel getItem(int index) {
    PhraseModel phraseModel = phrasesList[index];
    bool isFavorite = containElement(phraseModel);
    return PhraseItemViewModel(
        phrase: phraseModel,
        favoriteButtonCallback: (phrase) =>
            isFavorite ? removeFromFavorites(phrase) : addToFavorites(phrase),
        favoriteButtonBackground: isFavorite ? Colors.red : Colors.grey[100],
        favoriteButtonForeground: isFavorite ? Colors.white : Colors.black,
        favoriteButtonText:
            isFavorite ? "Remove from favorites" : "Add to favorites");
  }
}
