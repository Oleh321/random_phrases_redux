import 'package:random_phrases_redux/model/phrase_model.dart';
import 'package:random_phrases_redux/model/screen.dart';
import 'package:random_phrases_redux/redux/action/navigation_action.dart';
import 'package:random_phrases_redux/redux/action/thunk/api_requests_thunk_actions.dart';
import 'package:random_phrases_redux/redux/state/app_state.dart';
import 'package:redux/redux.dart';

class InitialViewModel {
  static const Screen screen = Screen.INITIAL;
  static const int AMOUNT_OF_PHRASES = 1;
  final PhraseModel phrase;
  final bool isLoading;

  final Function(Screen) moveToScreen;
  final Function loadPhrase;

  InitialViewModel(
      {this.phrase, this.isLoading, this.moveToScreen, this.loadPhrase});

  static InitialViewModel fromStore(Store<AppState> store) {
    return InitialViewModel(
      phrase: store.state.initialPhraseState.phraseModel,
      isLoading: store.state.loadingState.isLoading,
      loadPhrase: () =>
          store.dispatch(loadRandomPhrasesAction(screen, AMOUNT_OF_PHRASES)),
      moveToScreen: (nextScreen) =>
          store.dispatch(MoveToScreenAction(nextScreen)),
    );
  }
}
