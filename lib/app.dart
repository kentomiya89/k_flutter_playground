import 'package:flutter/material.dart';
import 'package:k_flutter_playground/screen/playground_list_screen.dart';

class PlaygroundApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlaygroundListScreen(),
    );
  }
}
