import 'package:flutter/material.dart';
import 'package:music_player/ui/pages/discover/discover_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/discover': (context) => DiscoverPage(),
      },
    );
  }
}
