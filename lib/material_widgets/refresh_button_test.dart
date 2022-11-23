import 'package:flutter/material.dart';

class RefreshButtonTest extends StatefulWidget {
  const RefreshButtonTest({Key? key}) : super(key: key);

  @override
  State<RefreshButtonTest> createState() => _RefreshButtonTestState();
}

class _RefreshButtonTestState extends State<RefreshButtonTest> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('count $count'),
      ),
      body: SafeArea(
        child: Center(
          child: RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: Text('hello'),
                    ),
                  );
                },
              ),
              onRefresh: () async {
                Future.delayed(const Duration(milliseconds: 100), () {
                  setState(() {
                    count++;
                  });
                });
              }),
        ),
      ),
    );
  }
}
