import 'package:flutter/material.dart';

import 'samples/navigation_pattern/navigation_pattern_screen.dart';
import 'samples/playground_list_screen.dart';

class PlaygroundApp extends StatelessWidget {
  const PlaygroundApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PlaygroundListScreen(),
        '/namedRoute': (context) => const NamedRouteScreen(),
      },
    );
  }
}
