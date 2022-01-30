import 'package:flutter/material.dart';

class PlaygroundListTile extends StatelessWidget {
  const PlaygroundListTile({
    Key? key,
    required this.title,
    required this.page,
    this.isModalScreen = false,
  }) : super(key: key);

  final String title;
  final Widget page;
  final bool isModalScreen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
      ),
      trailing: const Icon(
        Icons.keyboard_arrow_right,
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => page,
          fullscreenDialog: isModalScreen,
        ),
      ),
    );
  }
}
