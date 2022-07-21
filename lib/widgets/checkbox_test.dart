import 'package:flutter/material.dart';

class CheckBoxTest extends StatefulWidget {
  const CheckBoxTest({Key? key}) : super(key: key);

  @override
  State<CheckBoxTest> createState() => _CheckBoxTestState();
}

class _CheckBoxTestState extends State<CheckBoxTest> {
  List<bool> values = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Checkbox(
                  value: values[index],
                  onChanged: (a) {
                    setState(() {
                      if (index == 0) {
                        for (int i = 0; i < 3; i++) {
                          values[i] = a!;
                        }
                      } else {
                        values[index] = a!;
                      }
                    });
                  });
            },
          ),
        ),
      ),
    );
  }
}
