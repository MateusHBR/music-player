import 'package:music_player/domain/usecases/usecases.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/helpers/helpers.dart';

import '../../../ui/pages/discover/discover.dart';

class RxDartDiscoverPresenter implements DiscoverPresenter {
  final LoadMusics loadMostPlayedMusicsUseCase;
  final LoadMusics loadRecentPlayedMusicsUseCase;

  RxDartDiscoverPresenter({
    required this.loadMostPlayedMusicsUseCase,
    required this.loadRecentPlayedMusicsUseCase,
  });

  final _discoverScreenStateStream = BehaviorSubject<DiscoverState>.seeded(
    DiscoverLoadingState(),
  );

  final _errorMessageStream = PublishSubject<String?>();

  final _onEndOpacityTransitionStream = PublishSubject<bool>();

  @override
  Stream<DiscoverState> get discoverScreenState =>
      _discoverScreenStateStream.distinct();

  @override
  void dispose() {
    _discoverScreenStateStream.close();
    _errorMessageStream.close();
    _onEndOpacityTransitionStream.close();
  }

  @override
  Stream<String?> get errorMessage => _errorMessageStream;

  @override
  Future<void> loadMusics() async {
    _discoverScreenStateStream.add(DiscoverLoadingState());
    try {
      final listOfRecentPlayedMusics = await loadRecentPlayedMusicsUseCase();
      final listOfMostPlayedMusics = await loadMostPlayedMusicsUseCase();

      _discoverScreenStateStream.add(
        DiscoverSuccessState(
          listOfMostPlayedMusics: listOfMostPlayedMusics,
          listOfRecentPlayedMusics: listOfRecentPlayedMusics,
        ),
      );
    } on DomainError catch (error) {
      _discoverScreenStateStream.add(DiscoverErrorState());
      _errorMessageStream.add(error.message);
    }
  }

  @override
  void onEndCurrentOpacityTransition(bool isKeyboardVisible) {
    _onEndOpacityTransitionStream.add(isKeyboardVisible);
  }

  @override
  Stream<bool> get opacityIsNotDisplayingBody => _onEndOpacityTransitionStream;
}
