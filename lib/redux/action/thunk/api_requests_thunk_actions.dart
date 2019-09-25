import 'dart:convert';

import 'package:http/http.dart';
import 'package:random_phrases_redux/model/phrase_model.dart';
import 'package:random_phrases_redux/model/screen.dart';
import 'package:random_phrases_redux/redux/action/loading_phrases_actions.dart';
import 'package:random_phrases_redux/redux/state/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

const String BACKEND_ENDPOINT =
    "https://quotesondesign.com/wp-json/wp/v2/posts?orderby=rand&per_page=";

ThunkAction<AppState> loadRandomPhrasesAction(Screen screen, [int amount = 10]) {
  return (Store<AppState> store) async {
    store.dispatch(DisplayLoadingAction(true));
    Response response =
        await get(Uri.encodeFull(BACKEND_ENDPOINT + amount.toString()));
    List<dynamic> results = json.decode(response.body);

    List<PhraseModel> phrasesList = [];

    for (var item in results) {
      phrasesList.add(PhraseModel(
          item["content"]["rendered"]
              .replaceAll('<p>', '')
              .replaceAll('<\/p>', '')
              .replaceAll(new RegExp('&#8217;'), '\'')
              .replaceAll(new RegExp('&#8211;'), '-')
              .replaceAll(new RegExp('\\n'), '').trim(),
          item["title"]["rendered"]));
    }

    switch (screen) {
      case Screen.INITIAL:
        store.dispatch(LoadInitialPhraseAction(phrasesList[0] ?? PhraseModel("", "")));
        break;
      case Screen.RANDOM_LIST:
        store.dispatch(LoadRandomPhrasesListAction(phrasesList));
        break;
      default:
        break;
    }

    store.dispatch(DisplayLoadingAction(false));
  };
}
