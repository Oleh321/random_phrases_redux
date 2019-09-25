import 'package:random_phrases_redux/model/phrase_model.dart';
import 'package:random_phrases_redux/redux/action/favorites_action.dart';
import 'package:random_phrases_redux/redux/state/app_state.dart';
import 'package:redux/redux.dart';

class FavoritePhraseListViewModel {
  final List<PhraseModel> phrasesList;

  final Function(PhraseModel) containElement;

  final Function(PhraseModel) addToFavorites;
  final Function(PhraseModel) removeFromFavorites;

  FavoritePhraseListViewModel(this.phrasesList, this.containElement,
      this.addToFavorites, this.removeFromFavorites);

  static FavoritePhraseListViewModel fromStore(Store<AppState> store) {
    return FavoritePhraseListViewModel(
        store.state.favoritePhrasesListState.favoriteList,
        (phrase) =>
            store.state.favoritePhrasesListState.favoriteList.contains(phrase),
        (phrase) => store.dispatch(AddToFavoritesAction(phrase)),
        (phrase) => store.dispatch(RemoveFromFavoritesAction(phrase)));
  }
}
