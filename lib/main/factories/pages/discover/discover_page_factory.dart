import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../ui/pages/discover/discover.dart';

import '../../factories.dart';

Widget makeDiscoverPage() {
  return Provider(
    create: (_) => makeRxDartMusicPlayerPresenter(),
    child: DiscoverPage(
      presenter: makeRxDartDiscoverPresenter(),
    ),
  );
}
