import 'package:flutter/material.dart';

import '../../../../ui/pages/discover/discover.dart';

import '../../factories.dart';

Widget makeDiscoverPage() {
  return DiscoverPage(
    presenter: makeRxDartDiscoverPresenter(),
  );
}
