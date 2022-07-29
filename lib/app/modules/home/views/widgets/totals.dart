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
      children: [
        const Text(
          'Resumo da atividade',
          style: TextStyle(
            fontFamily: 'NunitoSans',
            fontWeight: FontWeight.w400,
            fontSize: 19,
            color: Color(0xFF59666F),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            TotalsCard(
              icon: 'pedidos_dash.svg',
              iconColor: const Color(0xFFF4C8E1),
              description: '${controller.dashboardData.ordersCount} Pedidos',
              amount: controller.dashboardData.ordersTotal!,
            ),
            const SizedBox(width: 16),
            TotalsCard(
              icon: 'vendas.svg',
              iconColor: const Color(0xFFB6EEDD),
              description: '${controller.dashboardData.salesCount} Vendas',
              amount: controller.dashboardData.salesTotal!,
            ),
            const SizedBox(width: 16),
            TotalsCard(
              icon: 'calculo.svg',
              iconColor: const Color(0xFFC3E7F3),
              description: 'Ticket médio',
              amount: controller.dashboardData.averageTicket!,
            ),
          ],
        ),
      ],
    );
  }
}
