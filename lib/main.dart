import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:random_phrases_redux/model/screen.dart';
import 'package:random_phrases_redux/redux/store.dart';
import 'package:random_phrases_redux/ui/initial_screen.dart';
import 'package:random_phrases_redux/ui/random_phrase_list_screen.dart';
import 'package:random_phrases_redux/utils.dart';

void main() async {
  var _store = await createStore();
  runApp(
      StoreProvider(
        store: _store,
        child: MaterialApp(
          title: "Random phrases redux",
          debugShowCheckedModeBanner: false,
          initialRoute: namedRoutes[Screen.INITIAL],
          navigatorKey:Keys.navKey,
          routes: <String, WidgetBuilder>{
            namedRoutes[Screen.INITIAL]: (BuildContext context) => InitialScreen(),
            namedRoutes[Screen.RANDOM_LIST]: (BuildContext context) => RandomPhrasesListScreen(),
//            namedRoutes[Screen.FAVORITES]: (BuildContext context) => (),
          },
        ),
      )
  );
}
