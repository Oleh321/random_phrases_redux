import 'package:random_phrases_redux/redux/action/loading_phrases_actions.dart';
import 'package:random_phrases_redux/redux/state/loading_state.dart';
import 'package:redux/redux.dart';

var loadingReducer = combineReducers<LoadingState>([
TypedReducer<LoadingState,  DisplayLoadingAction>(
    _displayLoading)
]);

LoadingState _displayLoading(LoadingState state, DisplayLoadingAction action) {
  return LoadingState(action.isLoading);
}
