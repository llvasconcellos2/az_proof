import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../utils.dart';
import '../../controllers/home_controller.dart';

class DataGrid extends StatefulWidget {
  const DataGrid({Key? key}) : super(key: key);

  @override
  State<DataGrid> createState() => _DataGridState();
}

class _DataGridState extends State<DataGrid> {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder(
        horizontalInside: BorderSide(
          width: 1,
          color: Color(0xFFF5F5F5),
          style: BorderStyle.solid,
        ),
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      defaultColumnWidth: const FlexColumnWidth(),
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(170),
        1: FixedColumnWidth(110),
        2: FlexColumnWidth(),
        3: FixedColumnWidth(160),
        // 4: FlexColumnWidth(),
        // 5: FlexColumnWidth(),
        // 6: FlexColumnWidth(),
        // 7: FlexColumnWidth(),
      },
      children: <TableRow>[
        DataGridHeader(content: const [
          'ID Pedido',
          'Data Criação',
          'Nome do Cliente',
          'CPF/CNPJ Cliente',
          'Status Pedido',
          'Status Pagamento',
          'Método Pagamento',
          'Total',
        ]),
        for (var order in controller.dashboardData.orders!)
          TableRow(children: [
            DataGridCell(
              '#${order.sId!}',
              isFirst: true,
              bgColor: Colors.white,
            ),
            DataGridCell(DateFormat('dd/MM/y').format(order.createdAt!)),
            DataGridCell(
              order.customer!.name!,
              bgColor: Colors.white,
            ),
            DataGridCell(Utils.cpfCnpjFormat(order.customer!.doc!)),
            DataGridCell(
              Utils.orderStatusFormat(order.status!),
              bgColor: Colors.white,
            ),
            DataGridCell(Utils.paymentStatusFormat(order.payment!.status!)),
            DataGridCell(
              Utils.paymentMethodFormat(order.payment!.method!),
              bgColor: Colors.white,
            ),
            DataGridCell(
                NumberFormat.simpleCurrency(locale: 'pt_BR')
                    .format(order.payment!.amount!),
                isLast: true),
          ]),
      ],
    );
  }
}

class DataGridCell extends StatelessWidget {
  final String content;
  final Color bgColor;
  final Color textColor;
  final bool isHeader;
  final bool isFooter;
  final bool isFirst;
  final bool isLast;
  late final BorderRadius _borderRadius;
  late final BoxDecoration _boxDecoration;

  DataGridCell(
    this.content, {
    this.bgColor = Colors.transparent,
    this.textColor = const Color(0xFF59666F),
    this.isHeader = false,
    this.isFooter = false,
    this.isFirst = false,
    this.isLast = false,
    Key? key,
  }) : super(key: key) {
    _borderRadius = BorderRadius.only(
      topLeft: isHeader && isFirst ? const Radius.circular(8) : Radius.zero,
      topRight: isHeader && isLast ? const Radius.circular(8) : Radius.zero,
      bottomLeft: isFooter && isFirst ? const Radius.circular(8) : Radius.zero,
      bottomRight: isFooter && isLast ? const Radius.circular(8) : Radius.zero,
    );

    var borderSide = BorderSide(
      color: isHeader ? const Color(0xFFFE7C6E) : const Color(0xFFF5F5F5),
      style: BorderStyle.solid,
      width: 1,
    );
    _boxDecoration = BoxDecoration(
      color: bgColor,
      border: Border(
        left: isFirst ? borderSide : BorderSide.none,
        //right: isHeader && isLast ? borderSide : BorderSide.none,
        right: borderSide,
        top: isHeader ? borderSide : BorderSide.none,
        bottom: isFooter ? borderSide : BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: ClipRRect(
        borderRadius: _borderRadius,
        child: Container(
          decoration: _boxDecoration,
          alignment: Alignment.centerLeft,
          height: 56,
          padding: const EdgeInsets.all(8),
          child: Text(
            content,
            style: TextStyle(
              color: textColor,
              fontFamily: 'NunitoSans',
              fontWeight: FontWeight.w400,
              fontSize: isHeader ? 14 : 12,
            ),
          ),
        ),
      ),
    );
  }
}

class DataGridHeader extends TableRow {
  final List<String> content;
  final Color evensColor;
  final Color oddsColor;

  factory DataGridHeader({
    content,
    evensColor = const Color(0xFFFE877A),
    oddsColor = const Color(0xFFFE7C6E),
    LocalKey? key,
  }) {
    var cells = <Widget>[];
    for (var title in content.asMap().entries) {
      cells.add(DataGridCell(
        title.value,
        isFirst: title.key == 0 ? true : false,
        isLast: title.key == content.length - 1 ? true : false,
        isHeader: true,
        bgColor: title.key.isOdd ? oddsColor : evensColor,
        textColor: Colors.white,
      ));
    }
    return DataGridHeader._(content, evensColor, oddsColor, key, cells);
  }

  const DataGridHeader._(
    this.content,
    this.evensColor,
    this.oddsColor,
    LocalKey? key,
    List<Widget> cells,
  ) : super(key: key, children: cells);
}
