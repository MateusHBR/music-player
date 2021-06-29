abstract class DiscoverPresenter {
  Future<void> loadMusics();

  Stream<bool> get isLoading;
}
