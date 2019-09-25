import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:random_phrases_redux/redux/state/app_state.dart';
import 'package:random_phrases_redux/ui/phrase_item.dart';
import 'package:random_phrases_redux/ui/viewmodel/random_phrase_list_viewmodel.dart';

class RandomPhrasesListScreen extends StatefulWidget{
  @override
  _RandomPhrasesListScreenState createState() => _RandomPhrasesListScreenState();
}

class _RandomPhrasesListScreenState extends State<RandomPhrasesListScreen> {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RandomPhraseListViewModel>(
      onInitialBuild: (viewModel) => viewModel.loadRandomList(),
      rebuildOnChange: true,
      converter: (store) => RandomPhraseListViewModel.fromStore(store),
      builder: (context, viewModel) => Scaffold(
        appBar: AppBar(
          title: Text("Random list"),
        ),
        body: viewModel.isLoading || viewModel.phrasesList == null || viewModel.phrasesList.length == 0?
        Center(child: CircularProgressIndicator())
        : _buildContent(context, viewModel),
      ),
    );
  }

  Widget _buildContent(BuildContext context, RandomPhraseListViewModel viewModel) {
    return ListView.separated(
      separatorBuilder: (ctxt, index) => Divider(color: Colors.blue, height: 3),
        itemCount: viewModel.phrasesList.length,
        itemBuilder: (ctxt, index) =>
            PhraseItem(viewModel: viewModel.getItem(index)),

    );
  }
}