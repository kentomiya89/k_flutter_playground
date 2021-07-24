import 'package:flutter/material.dart';

class DropdownButtonSample extends StatelessWidget {
  const DropdownButtonSample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ドロップダウン'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
