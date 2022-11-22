import 'package:flutter/material.dart';

class MaterialWidgetsScreen extends StatefulWidget {
  const MaterialWidgetsScreen({Key? key}) : super(key: key);

  @override
  State<MaterialWidgetsScreen> createState() => _MaterialWidgetsScreenState();
}

class _MaterialWidgetsScreenState extends State<MaterialWidgetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Placeholder(),
    );
  }
}