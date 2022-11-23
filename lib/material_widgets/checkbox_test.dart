import 'package:flutter/material.dart';

class CheckBoxTest extends StatefulWidget {
  const CheckBoxTest({Key? key}) : super(key: key);

  @override
  State<CheckBoxTest> createState() => _CheckBoxTestState();
}

class _CheckBoxTestState extends State<CheckBoxTest> {
  List<bool> values = [false, false, false];
  List<String> titles = ['A', 'B', 'C'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text(
                  titles[index],
                ),
                trailing: Checkbox(
                  value: values[index],
                  onChanged: (a) {
                    setState(
                      () {
                        values[index] = a!;
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
