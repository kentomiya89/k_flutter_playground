import 'package:flutter/material.dart';

class DropdownButtonSample extends StatelessWidget {
  const DropdownButtonSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ドロップダウン'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: DropdownButton(
            items: List.generate(100, (index) => 'hogehogehoge')
                .toList()
                .map((value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            onChanged: (_) {},
            isExpanded: true,
            menuMaxHeight: 450,
          ),
        ),
      ),
    );
  }
}
