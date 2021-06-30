import '../../../data/usecases/usecases.dart';
import '../../../ui/pages/discover/discover.dart';

class RxDartDiscoverPresenter implements DiscoverPresenter {
  final LoadMostPlayedMusics loadMostPlayedMusicsUseCase;
  final LoadRecentPlayedMusics loadRecentPlayedMusicsUseCase;

  RxDartDiscoverPresenter({
    required this.loadMostPlayedMusicsUseCase,
    required this.loadRecentPlayedMusicsUseCase,
  });

  @override
  // TODO: implement discoverScreenState
  Stream<DiscoverState> get discoverScreenState => throw UnimplementedError();

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  // TODO: implement errorMessage
  Stream<String?> get errorMessage => throw UnimplementedError();

  @override
  Future<void> loadMusics() async {
    await loadRecentPlayedMusicsUseCase();
    await loadMostPlayedMusicsUseCase();
  }

  @override
  void onEndCurrentOpacityTransition(bool isKeyboardVisible) {
    // TODO: implement onEndCurrentOpacityTransition
  }

  @override
  // TODO: implement opacityIsNotDisplayingBody
  Stream<bool> get opacityIsNotDisplayingBody => throw UnimplementedError();
}
