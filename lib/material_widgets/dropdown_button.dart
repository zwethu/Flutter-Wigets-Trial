import 'package:flutter/material.dart';

class DropdownBox extends StatefulWidget {
  const DropdownBox({Key? key}) : super(key: key);

  @override
  State<DropdownBox> createState() => _DropdownBoxState();
}

class _DropdownBoxState extends State<DropdownBox> {
  String value = 'aung aung';
  final items = ['aung aung', 'mg mg', 'su su', 'nyi nyi'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: DropdownButton(
            enableFeedback: true,
            value: value,
            items: items.map(buildMenuItems).toList(),
            onChanged: (value) => setState(() {
              this.value = value.toString();
            }),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItems(String item) => DropdownMenuItem(
    enabled: false,
        value: item,
        child: SizedBox(
          width: 150,
          child: Text(item),
        ),
      );
}
