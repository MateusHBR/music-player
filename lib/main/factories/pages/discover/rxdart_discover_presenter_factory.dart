import '../../../../presentation/presenters/discover_presenter/discover_presenter.dart';

import '../../../../ui/pages/discover/discover.dart';

import '../../factories.dart';

DiscoverPresenter makeRxDartDiscoverPresenter() {
  return RxDartDiscoverPresenter(
    loadMostPlayedMusicsUseCase: makeMostPlayedMusics(),
    loadRecentPlayedMusicsUseCase: makeRecentPlayedMusics(),
  );
}
