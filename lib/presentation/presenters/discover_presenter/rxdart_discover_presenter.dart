import 'package:rxdart/rxdart.dart';

import '../../../data/usecases/usecases.dart';

import '../../../domain/helpers/helpers.dart';

import '../../../ui/pages/discover/discover.dart';

class RxDartDiscoverPresenter implements DiscoverPresenter {
  final LoadMostPlayedMusics loadMostPlayedMusicsUseCase;
  final LoadRecentPlayedMusics loadRecentPlayedMusicsUseCase;

  RxDartDiscoverPresenter({
    required this.loadMostPlayedMusicsUseCase,
    required this.loadRecentPlayedMusicsUseCase,
  });

  final _discoverScreenState = BehaviorSubject<DiscoverState>.seeded(
    DiscoverLoadingState(),
  );

  @override
  Stream<DiscoverState> get discoverScreenState => _discoverScreenState;

  @override
  void dispose() {
    _discoverScreenState.close();
  }

  @override
  // TODO: implement errorMessage
  Stream<String?> get errorMessage => throw UnimplementedError();

  @override
  Future<void> loadMusics() async {
    try {
      await loadRecentPlayedMusicsUseCase();
      await loadMostPlayedMusicsUseCase();
    } on DomainError catch (error) {
      _discoverScreenState.add(DiscoverErrorState());
    }
  }

  @override
  void onEndCurrentOpacityTransition(bool isKeyboardVisible) {
    // TODO: implement onEndCurrentOpacityTransition
  }

  @override
  // TODO: implement opacityIsNotDisplayingBody
  Stream<bool> get opacityIsNotDisplayingBody => throw UnimplementedError();
}
