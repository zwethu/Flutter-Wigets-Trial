import "package:flutter/material.dart";

class LinearProgressIndicatorTest extends StatefulWidget {
  const LinearProgressIndicatorTest({Key? key}) : super(key: key);

  @override
  State<LinearProgressIndicatorTest> createState() =>
      _LinearProgressIndicatorTestState();
}

class _LinearProgressIndicatorTestState
    extends State<LinearProgressIndicatorTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: LinearProgressIndicator(
          color: Colors.yellow,
        ),
      ),
    );
  }
}
