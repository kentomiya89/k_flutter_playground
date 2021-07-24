import 'package:flutter/material.dart';

class PlaygroundListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('サンプル集'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
