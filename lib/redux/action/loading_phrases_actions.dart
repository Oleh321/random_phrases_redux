import 'package:random_phrases_redux/model/phrase_model.dart';

class LoadRandomPhrasesListAction{
  final List<PhraseModel> phrases;

  LoadRandomPhrasesListAction(this.phrases);
}

class LoadInitialPhraseAction {
  final PhraseModel phrase;

  LoadInitialPhraseAction(this.phrase);
}

class DisplayLoadingAction {
  final bool isLoading;

  DisplayLoadingAction(this.isLoading);
}