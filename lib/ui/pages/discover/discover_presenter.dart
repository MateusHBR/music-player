import 'discover_state.dart';

abstract class DiscoverPresenter {
  Stream<bool> get opacityIsNotDisplayingBody;
  Stream<DiscoverState> get discoverScreenState;

  Future<void> loadMusics();
  void onEndCurrentOpacityTransition(bool isKeyboardVisible);
  void dispose();
}
