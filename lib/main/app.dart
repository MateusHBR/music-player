import 'package:flutter/material.dart';

import '../ui/values/values.dart' as values;

import 'factories/factories.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IndaBand',
      theme: values.Theme.primary,
      initialRoute: '/discover',
      routes: {
        '/discover': (context) => makeDiscoverPage(),
      },
    );
  }
}
