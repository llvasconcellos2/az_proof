import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
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
    return Column(
      children: [
        Table(
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
        ),
        const DataGridPaginationFooter(),
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

class DataGridPaginationFooter extends StatelessWidget {
  const DataGridPaginationFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: const Color(0xFFF5F5F5),
        child: Row(
          children: [
            const Icon(
              FeatherIcons.chevronsLeft,
              size: 24,
              color: Color(0xFFFE7C6E),
            ),
            const SizedBox(width: 22),
            const Icon(
              FeatherIcons.chevronLeft,
              size: 24,
              color: Color(0xFFFE7C6E),
            ),
            const SizedBox(width: 36),
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF97A1A8),
                      height: 1.2,
                    ),
                  ),
                ),
                const SizedBox(width: 21),
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFE7C6E),
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                ),
                const SizedBox(width: 21),
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF97A1A8),
                      height: 1.2,
                    ),
                  ),
                ),
                const SizedBox(width: 21),
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '4',
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF97A1A8),
                      height: 1.2,
                    ),
                  ),
                ),
                const SizedBox(width: 21),
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '5',
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF97A1A8),
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 36),
            const Icon(
              FeatherIcons.chevronRight,
              size: 24,
              color: Color(0xFFFE7C6E),
            ),
            const SizedBox(width: 22),
            const Icon(
              FeatherIcons.chevronsRight,
              size: 24,
              color: Color(0xFFFE7C6E),
            ),
            const SizedBox(width: 52),
            const Text(
              '1 de 10 páginas',
              style: TextStyle(
                fontFamily: 'NunitoSans',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFF97A1A8),
                height: 1.2,
              ),
            ),
            const Spacer(),
            const Text(
              'Linhas por página',
              style: TextStyle(
                fontFamily: 'NunitoSans',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFF97A1A8),
                height: 1.2,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 87,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFFE6E6E6),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  value: 6,
                  icon: const Icon(FeatherIcons.chevronDown),
                  style: const TextStyle(
                    fontFamily: 'NunitoSans',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF97A1A8),
                    height: 1.2,
                  ),
                  onChanged: (int? newValue) {
                    // setState(() {
                    //   dropdownValue = newValue!;
                    // });
                  },
                  items: <int>[5, 6, 7, 8, 9, 10, 15, 20]
                      .reversed
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(NumberFormat('00').format(value)),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
