import 'package:random_phrases_redux/model/phrase_model.dart';

class AddToFavoritesAction {
  final PhraseModel phrase;

  AddToFavoritesAction(this.phrase);
}

class RemoveFromFavoritesAction {
  final PhraseModel phrase;

  RemoveFromFavoritesAction(this.phrase);
}

