import 'package:flutter/material.dart';

class SwitchTest extends StatefulWidget {
  const SwitchTest({Key? key}) : super(key: key);

  @override
  State<SwitchTest> createState() => _SwitchTestState();
}

class _SwitchTestState extends State<SwitchTest> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Switch(
            value: value,
            onChanged: (a) {
              setState(
                () {
                  value = a;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
