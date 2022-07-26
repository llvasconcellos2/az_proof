import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'totals_card.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 250,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26.withOpacity(0),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0.0, 0.5),
                ),
              ],
            ),
            child: Drawer(
              backgroundColor: Colors.white,
              elevation: 2,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: (kToolbarHeight * 1.1),
                    height: (kToolbarHeight * 1.1),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/reduzido.svg',
                        clipBehavior: Clip.antiAlias,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ListTile(
                        textColor: Color(0xFF8F95B2),
                        iconColor: Color(0xFF8F95B2),
                        selected: true,
                        selectedColor: Colors.white,
                        selectedTileColor: Color(0xFFFE7C6E),
                        horizontalTitleGap: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Color(0xFFF5F5F5),
                          ),
                        ),
                        leading: SvgPicture.asset(
                          'assets/images/home.svg',
                          color: Colors.white,
                        ),
                        title: Text(
                          'Dashboard',
                          style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        onTap: () => Get.offAndToNamed(Routes.HOME)),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        controller: ScrollController(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 80),
                            Container(
                              constraints: BoxConstraints(
                                minHeight:
                                    MediaQuery.of(context).size.height - 135,
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 25,
                                horizontal: 40,
                              ),
                              child: Container(
                                // O conteúdo do seu teste fica AQUI!
                                padding: EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 24,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Resumo da atividade',
                                      style: TextStyle(
                                        fontFamily: 'NunitoSans',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 19,
                                        color: Color(0xFF59666F),
                                        height: 1.2,
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                    Row(
                                      children: [
                                        TotalsCard(
                                          icon: 'pedidos_dash.svg',
                                          iconColor: Color(0xFFF4C8E1),
                                          description: '200 Pedidos',
                                          amount: 'R\$ 50.480,95',
                                        ),
                                        SizedBox(width: 16),
                                        TotalsCard(
                                          icon: 'vendas.svg',
                                          iconColor: Color(0xFFB6EEDD),
                                          description: '156 Vendas',
                                          amount: 'R\$ 35.996,42',
                                        ),
                                        SizedBox(width: 16),
                                        TotalsCard(
                                          icon: 'calculo.svg',
                                          iconColor: Color(0xFFC3E7F3),
                                          description: 'Ticket médio',
                                          amount: 'R\$ 230,74',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Color(0xffF5F5F5),
                              height: 56,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 21),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/logo_azape.svg',
                                    width: 30,
                                    height: 30,
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    '® Desenvolvido por Azape',
                                    style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xFF97A1A8),
                                    ),
                                  ),
                                  SizedBox(width: 48),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Card(
                  elevation: 0.5,
                  margin: EdgeInsets.only(top: 0, left: 0.5, right: 0),
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.05),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0.0, 0.5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Olá,',
                                    style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xff59666F),
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      controller.userName.value
                                          .split(' ')
                                          .first,
                                      style: TextStyle(
                                        fontFamily: 'NunitoSans',
                                        color: Color(0xff59666F),
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 16),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFFE7C6E),
                                ),
                                child: Center(
                                  child: Icon(
                                    FeatherIcons.user,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
