import 'package:flutter/material.dart';

enum Mode { day, night }

class RadioButtonTest extends StatefulWidget {
  const RadioButtonTest({Key? key}) : super(key: key);

  @override
  State<RadioButtonTest> createState() => _RadioButtonTestState();
}

class _RadioButtonTestState extends State<RadioButtonTest> {
  Mode mode = Mode.day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                toggleable: true,
                  value: Mode.day,
                  groupValue: mode,
                  onChanged: (value) {
                    setState(() {
                      mode = Mode.day;
                    });
                  }),
              const Text('day'),
              Radio(
                  value: Mode.night,
                  groupValue: mode,
                  onChanged: (value) {
                    setState(() {
                      mode = Mode.night;
                    });
                  }),
              const Text('night'),
            ],
          ),
        ),
      ),
    );
  }
}
