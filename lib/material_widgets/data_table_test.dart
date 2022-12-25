import 'package:flutter/material.dart';

class DataTableTest extends StatefulWidget {
  const DataTableTest({Key? key}) : super(key: key);

  @override
  State<DataTableTest> createState() => _DataTableTestState();
}

class _DataTableTestState extends State<DataTableTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: DataTable(
            columns: const [
              DataColumn(
                label: Text('Name'),
              ),
              DataColumn(
                label: Text('Age'),
              ),
            ],
            rows: const [
              DataRow(
                cells: [
                  DataCell(Text('Mg Mg')),
                  DataCell(Text('18'),showEditIcon: true),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Enter your name'),placeholder: true),
                  DataCell(Text('19')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
