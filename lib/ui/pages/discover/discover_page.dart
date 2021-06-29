import 'package:flutter/material.dart';

import 'discover_presenter.dart';

class DiscoverPage extends StatefulWidget {
  final DiscoverPresenter? presenter;

  DiscoverPage({Key? key, this.presenter}) : super(key: key);
  // DiscoverPage({Key? key, required this.presenter}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState(this.presenter);
}

class _DiscoverPageState extends State<DiscoverPage> {
  final DiscoverPresenter? presenter;

  _DiscoverPageState(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
