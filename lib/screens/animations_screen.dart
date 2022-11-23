import 'package:flutter/material.dart';
import 'package:widgets_testing/models/data_model/widget_item.dart';

class AnimationsScreen extends StatefulWidget {
  const AnimationsScreen({Key? key}) : super(key: key);

  @override
  State<AnimationsScreen> createState() => _AnimationsScreenState();
}

class _AnimationsScreenState extends State<AnimationsScreen> {
  List<WidgetItem> items = [
    WidgetItem('Sand Clock Animation', '/sand_clock_animation'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, items[index].routeName);
            },
            child: ListTile(
              title: Text(
                items[index].title,
              ),
            ),
          );
        }),
      ),
    );
  }
}