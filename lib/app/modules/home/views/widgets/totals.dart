import 'package:az_proof/app/az_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import 'totals_card.dart';

class Totals extends StatelessWidget {
  final controller = Get.find<HomeController>();
  Totals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Resumo da atividade',
          style: TextStyle(
            fontFamily: 'NunitoSans',
            fontWeight: FontWeight.w400,
            fontSize: 19,
            color: AzColors.deepBlueGray,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            TotalsCard(
              icon: 'pedidos_dash.svg',
              iconColor: AzColors.lightPink,
              description: '${controller.dashboardData.ordersCount} Pedidos',
              amount: controller.dashboardData.ordersTotal!,
            ),
            const SizedBox(width: 16),
            TotalsCard(
              icon: 'vendas.svg',
              iconColor: AzColors.lightGreen,
              description: '${controller.dashboardData.salesCount} Vendas',
              amount: controller.dashboardData.salesTotal!,
            ),
            const SizedBox(width: 16),
            TotalsCard(
              icon: 'calculo.svg',
              iconColor: AzColors.lightCyan,
              description: 'Ticket médio',
              amount: controller.dashboardData.averageTicket!,
            ),
          ],
        ),
      ],
    );
  }
}
