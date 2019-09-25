import 'package:flutter/material.dart';
import 'package:random_phrases_redux/model/phrase_model.dart';

class PhraseItem extends StatelessWidget {
  final PhraseItemViewModel viewModel;

  const PhraseItem({Key key, this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Text(
              viewModel.phrase.quote,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 16),
            width: double.infinity,
            child: Text(
              viewModel.phrase.author,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 12,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 16),
            child: MaterialButton(
              onPressed: () => viewModel.markAsFavorite(viewModel.phrase),
              child: Text(viewModel.favoriteButtonText,
                  style: TextStyle(color: viewModel.favoriteButtonForeground, fontSize: 12)),
              color: viewModel.favoriteButtonBackground,
            ),
          ),
        ],
      ),
    );
  }
}

class PhraseItemViewModel {
  PhraseModel phrase;
  String favoriteButtonText;
  Color favoriteButtonForeground;
  Color favoriteButtonBackground;
  Function(PhraseModel) markAsFavorite;

  PhraseItemViewModel(
      {this.phrase,
      this.favoriteButtonText,
      this.favoriteButtonForeground,
      this.favoriteButtonBackground,
      this.markAsFavorite});
}
