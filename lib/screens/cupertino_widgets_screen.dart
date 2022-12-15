import 'package:flutter/material.dart';

class CupertinoWidgetsScreen extends StatefulWidget {
  const CupertinoWidgetsScreen({Key? key}) : super(key: key);

  @override
  State<CupertinoWidgetsScreen> createState() => _CupertinoWidgetsScreenState();
}

class _CupertinoWidgetsScreenState extends State<CupertinoWidgetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Placeholder(),
    );
  }
}