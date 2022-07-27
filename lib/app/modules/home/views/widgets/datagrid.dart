import 'package:flutter/material.dart';

class DataGrid extends StatefulWidget {
  const DataGrid({Key? key}) : super(key: key);

  @override
  State<DataGrid> createState() => _DataGridState();
}

class _DataGridState extends State<DataGrid> {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(64),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: const <TableRow>[],
    );
  }
}
