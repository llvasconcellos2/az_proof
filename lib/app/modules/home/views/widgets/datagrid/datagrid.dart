import 'package:az_proof/app/az_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../utils.dart';
import '../../../controllers/home_controller.dart';

part 'datagrid_cell.dart';
part 'datagrid_header.dart';
part 'datagrid_pagination_footer.dart';

class DataGrid extends StatelessWidget {
  final controller = Get.find<HomeController>();
  final RxInt pageNumber = 1.obs;
  final RxInt recordsPerPage = 6.obs;

  DataGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pedidos',
          style: TextStyle(
            fontFamily: 'NunitoSans',
            fontWeight: FontWeight.w400,
            fontSize: 19,
            color: AzColors.deepBlueGray,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 24),
        Table(
          border: const TableBorder(
            horizontalInside: BorderSide(
              width: 1,
              color: AzColors.whiteSmoke,
              style: BorderStyle.solid,
            ),
          ),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          defaultColumnWidth: const FlexColumnWidth(),
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(170),
            1: FixedColumnWidth(110),
            3: FixedColumnWidth(160),
            4: FixedColumnWidth(120),
            5: FixedColumnWidth(140),
            6: FixedColumnWidth(150),
            7: FixedColumnWidth(140),
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
