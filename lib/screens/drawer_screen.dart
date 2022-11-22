
import 'package:flutter/material.dart';
import 'package:widgets_testing/models/data_model/drawer_item.dart';


class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  List<DrawerItem> items = [
    DrawerItem('Basic Widget', '/basic_widgets'),
    DrawerItem('Material Widgets', '/material_widgets'),
    DrawerItem('Cupertino Widgets', '/cupertino_widgets'),
    DrawerItem('Animations', '/animations'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: ListView.builder(
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
        ),
      ),
    );
  }
}
