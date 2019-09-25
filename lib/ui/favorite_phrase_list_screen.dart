import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:random_phrases_redux/redux/state/app_state.dart';
import 'package:random_phrases_redux/ui/phrase_item.dart';
import 'package:random_phrases_redux/ui/viewmodel/favorite_phrase_list_viewmodel.dart';

class FavoritePhrasesListScreen extends StatefulWidget {
  @override
  _FavoritePhrasesListScreenState createState() =>
      _FavoritePhrasesListScreenState();
}

class _FavoritePhrasesListScreenState extends State<FavoritePhrasesListScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FavoritePhraseListViewModel>(
      rebuildOnChange: true,
      converter: (store) => FavoritePhraseListViewModel.fromStore(store),
      builder: (context, viewModel) => Scaffold(
        appBar: AppBar(
          title: Text("Favorite list"),
        ),
        body: _buildContent(context, viewModel),
      ),
    );
  }

  Widget _buildContent(
      BuildContext context, FavoritePhraseListViewModel viewModel) {
    return ListView.separated(
      separatorBuilder: (ctxt, index) => Divider(color: Colors.blue, height: 3),
      itemCount: viewModel.phrasesList.length,
      itemBuilder: (ctxt, index) =>
          PhraseItem(viewModel: viewModel.getItem(index)),
    );
  }
}
