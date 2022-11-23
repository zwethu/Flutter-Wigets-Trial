import 'package:flutter/material.dart';

class GridviewBuilderTest extends StatefulWidget {
  const GridviewBuilderTest({Key? key}) : super(key: key);

  @override
  State<GridviewBuilderTest> createState() => _GridviewBuilderTestState();
}

class _GridviewBuilderTestState extends State<GridviewBuilderTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 30,
              childAspectRatio: 2,
              crossAxisCount: 4,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.black,
                width: 100,
                height: 100,
              );
            },
          ),
        ),
      ),
    );
  }
}
