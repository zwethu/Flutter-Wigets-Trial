import 'package:flutter/material.dart';

class BackgroundImageTest extends StatefulWidget {
  const BackgroundImageTest({Key? key}) : super(key: key);

  @override
  State<BackgroundImageTest> createState() => _BackgroundImageTestState();
}

class _BackgroundImageTestState extends State<BackgroundImageTest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/chika.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(),
      ),
    );
  }
}
