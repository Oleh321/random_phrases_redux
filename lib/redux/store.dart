import 'dart:async';

import 'package:random_phrases_redux/redux/middlewere/navigation_middlewere.dart';
import 'package:random_phrases_redux/redux/reducer/app_reducer.dart';
import 'package:random_phrases_redux/redux/state/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:redux_thunk/redux_thunk.dart';

Future<Store<AppState>> createStore() async {
  final appPersistor = Persistor<AppState>(
    storage: FlutterStorage(),
    serializer: JsonSerializer<AppState>((json) => AppState.fromJson(json))
  );

  final initialState = await appPersistor.load();

  return Store(appReducer, initialState: initialState ?? AppState.initial(),
    middleware: [thunkMiddleware, NavigationMiddleware()]
  );
}