import 'package:flutter/material.dart';

class ExpansionPanelListWidget extends StatefulWidget {
  const ExpansionPanelListWidget({Key? key}) : super(key: key);

  @override
  State<ExpansionPanelListWidget> createState() =>
      _ExpansionPanelListWidgetState();
}

class _ExpansionPanelListWidgetState extends State<ExpansionPanelListWidget> {
  List<PanelItem> data = generateItems(15);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
              data[panelIndex].isExpanded = !isExpanded;
            });
          },
          children: data.map<ExpansionPanel>((PanelItem panelItem) {
            return ExpansionPanel(
              canTapOnHeader: true,
              headerBuilder: (context, isExpanded) => ListTile(
                title: Text(panelItem.headerValue),
              ),
              body: ListTile(
                title: Text(panelItem.expandedValue),
              ),
              isExpanded: panelItem.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class PanelItem {
  PanelItem(
      {required this.headerValue,
      required this.expandedValue,
      this.isExpanded = false});
  String headerValue;
  String expandedValue;
  bool isExpanded;
}

List<PanelItem> generateItems(int itemCount) {
  return List<PanelItem>.generate(itemCount, (index) {
    return PanelItem(
        headerValue: "Panel $index",
        expandedValue: "Hello, This is Panel $index");
  });
}
