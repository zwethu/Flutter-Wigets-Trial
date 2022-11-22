import 'package:flutter/material.dart';

class ListviewTest extends StatefulWidget {
  const ListviewTest({Key? key}) : super(key: key);

  @override
  State<ListviewTest> createState() => _ListviewTestState();
}

class _ListviewTestState extends State<ListviewTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                child: const Text('hello'),
              );
            },
          ),
        ),
      ),
    );
  }
}
