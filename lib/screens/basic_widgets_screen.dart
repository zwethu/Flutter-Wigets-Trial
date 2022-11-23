import 'package:flutter/material.dart';
import 'package:widgets_testing/models/data_model/widget_item.dart';

class BasicWidgetsScreen extends StatefulWidget {
  const BasicWidgetsScreen({Key? key}) : super(key: key);

  @override
  State<BasicWidgetsScreen> createState() => _BasicWidgetsScreenState();
}

class _BasicWidgetsScreenState extends State<BasicWidgetsScreen> {
  List<WidgetItem> items = [
    WidgetItem('BackgroundImage', '/background_image'),
    WidgetItem('Gridview Builder', '/gridview'),
    WidgetItem('Listview Builder', '/listview'),
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
