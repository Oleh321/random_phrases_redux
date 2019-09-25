import 'package:random_phrases_redux/model/screen.dart';
import 'package:random_phrases_redux/redux/action/navigation_action.dart';
import 'package:random_phrases_redux/redux/state/app_state.dart';
import 'package:random_phrases_redux/utils.dart';
import 'package:redux/redux.dart';

class NavigationMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
   if(action is MoveToScreenAction){
     Keys.navKey.currentState.pushNamed(namedRoutes[action.screen]);
   }
   next(action);
  }

}