import 'package:flutter/material.dart';
import 'package:widgets_testing/models/data_model/widget_item.dart';

class MaterialWidgetsScreen extends StatefulWidget {
  const MaterialWidgetsScreen({Key? key}) : super(key: key);

  @override
  State<MaterialWidgetsScreen> createState() => _MaterialWidgetsScreenState();
}

class _MaterialWidgetsScreenState extends State<MaterialWidgetsScreen> {
  List<WidgetItem> items = [
    WidgetItem('CheckBox', '/checkbox'),
    WidgetItem('CircularIndicator', '/circular_progress_indicator'),
    WidgetItem('DropdownButton', '/dropdown_button'),
    WidgetItem('Radio Button', '/radio_button'),
    WidgetItem('Refresh Button', '/refresh_button'),
    WidgetItem('Slider Button', '/slider'),
    WidgetItem('Swich Button', '/switch'),
    WidgetItem('Expansion Panel List', '/expansion_panel'),
    WidgetItem('Stepper', '/stepper'),
    WidgetItem('DataTable', '/data_table'),
    WidgetItem('Linear Progress Indicator', '/linear_progress_indicator'),
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
