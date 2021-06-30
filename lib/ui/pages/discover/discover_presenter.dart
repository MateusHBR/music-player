import 'discover_state.dart';

abstract class DiscoverPresenter {
  Stream<bool> get opacityIsNotDisplayingBody;
  Stream<DiscoverState> get discoverScreenState;
  Stream<String?> get errorMessage;

  Future<void> loadMusics();
  void onEndCurrentOpacityTransition(bool isKeyboardVisible);
  void dispose();
}
