import 'package:random_phrases_redux/redux/action/loading_phrases_actions.dart';
import 'package:random_phrases_redux/redux/state/initial_phrase_state.dart';
import 'package:redux/redux.dart';

var initialRandomPhraseReducer = combineReducers<InitialPhraseState>([
  TypedReducer<InitialPhraseState, LoadInitialPhraseAction>(
      _loadRandomPhrasesList)
]);

InitialPhraseState _loadRandomPhrasesList(
    InitialPhraseState state, LoadInitialPhraseAction action) {
  return InitialPhraseState(phraseModel: action.phrase);
}
