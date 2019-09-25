class LoadingState {
  final bool isLoading;

  LoadingState(this.isLoading);

  factory LoadingState.initial() => LoadingState(false);
}
