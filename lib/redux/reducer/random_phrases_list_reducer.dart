import 'package:random_phrases_redux/redux/action/loading_phrases_actions.dart';
import 'package:random_phrases_redux/redux/state/random_phrases_list_state.dart';
import 'package:redux/redux.dart';

var randomPhrasesListReducer = combineReducers<RandomPhrasesListState>([
  TypedReducer<RandomPhrasesListState, LoadRandomPhrasesListAction>(
      _loadRandomPhrasesList)
]);

RandomPhrasesListState _loadRandomPhrasesList(
    RandomPhrasesListState state, LoadRandomPhrasesListAction action) {
  return RandomPhrasesListState(randomPhrasesList: action.phrases);
}
