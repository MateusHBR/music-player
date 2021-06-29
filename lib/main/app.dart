import 'package:flutter/material.dart';

import '../ui/pages/discover/discover_page.dart';
import '../ui/values/values.dart' as values;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IndaBand',
      theme: values.Theme.primary,
      initialRoute: '/discover',
      routes: {
        '/discover': (context) => DiscoverPage(),
      },
    );
  }
}
