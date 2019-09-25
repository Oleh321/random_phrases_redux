
import 'package:random_phrases_redux/redux/action/favorites_action.dart';
import 'package:random_phrases_redux/redux/state/favorite_phrases_list_state.dart';
import 'package:redux/redux.dart';

var favoritePhrasesListReducer = combineReducers<FavoritePhrasesListState>([
  TypedReducer<FavoritePhrasesListState, AddToFavoritesAction>(_addToFavorites),
  TypedReducer<FavoritePhrasesListState, RemoveFromFavoritesAction>(_removeFromFavorites)
]);

FavoritePhrasesListState _removeFromFavorites(
    FavoritePhrasesListState state,
    RemoveFromFavoritesAction action) {
    state.favoriteList.remove(action.phrase);
  return state;
}



FavoritePhrasesListState _addToFavorites(
    FavoritePhrasesListState state,
    AddToFavoritesAction action) {
  state.favoriteList.add(action.phrase);
  return state;
}