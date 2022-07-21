import 'package:flutter/material.dart';

class CircularBar extends StatefulWidget {
  const CircularBar({Key? key}) : super(key: key);

  @override
  State<CircularBar> createState() => _CircularBarState();
}

class _CircularBarState extends State<CircularBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.blue,
            color: Colors.black,
            semanticsLabel: 'hello',
            semanticsValue: 'hi',
            valueColor: AlwaysStoppedAnimation<Color>(
              Color(0xfffd7013),
            ),
          ),
        ),
      ),
    );
  }
}
