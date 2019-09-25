import 'package:random_phrases_redux/redux/reducer/favorite_phrases_list_reducer.dart';
import 'package:random_phrases_redux/redux/reducer/initial_phrase_reducer.dart';
import 'package:random_phrases_redux/redux/reducer/loading_reducer.dart';
import 'package:random_phrases_redux/redux/reducer/random_phrases_list_reducer.dart';
import 'package:random_phrases_redux/redux/state/app_state.dart';

AppState appReducer(AppState state, action) => AppState(
    initialPhraseState:
        initialRandomPhraseReducer(state.initialPhraseState, action),
    favoritePhrasesListState:
        favoritePhrasesListReducer(state.favoritePhrasesListState, action),
    randomPhrasesListState:
        randomPhrasesListReducer(state.randomPhrasesListState, action),
    loadingState: loadingReducer(state.loadingState, action)
);
