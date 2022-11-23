import 'package:flutter/material.dart';

class SliderTest extends StatefulWidget {
  const SliderTest({Key? key}) : super(key: key);

  @override
  State<SliderTest> createState() => _SliderTestState();
}

class _SliderTestState extends State<SliderTest> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value.toInt().toString()),
              Slider(
                  label: 'hello',
                  min: 0,
                  max: 100,
                  value: value,
                  onChanged: (a) {
                    setState(() {
                      value = a;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
