import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utils.dart';
import '../../../az_theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'widgets/datagrid/datagrid.dart';
import 'widgets/totals.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.find<HomeController>();

  @override
  void initState() {
    controller.getData();
    super.initState();
  }

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
                  offset: const Offset(0.0, 0.5),
                ),
              ],
            ),
            child: Drawer(
              backgroundColor: Colors.white,
              elevation: 2,
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
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
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListTile(
                        textColor: AzTheme.red,
                        iconColor: AzTheme.red,
                        selected: true,
                        selectedColor: Colors.white,
                        selectedTileColor: AzTheme.red,
                        horizontalTitleGap: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: AzTheme.whiteSmoke,
                          ),
                        ),
                        leading: SvgPicture.asset(
                          'assets/images/home.svg',
                          color: Colors.white,
                        ),
                        title: const Text(
                          'Dashboard',
                          style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        onTap: () => Get.offAndToNamed(Routes.kHome)),
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
                            const SizedBox(height: 80),
                            Container(
                              constraints: BoxConstraints(
                                minHeight:
                                    MediaQuery.of(context).size.height - 135,
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 25,
                                horizontal: 40,
                              ),
                              child: Container(
                                // O conteúdo do seu teste fica AQUI!
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 24,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() {
                                      if (!controller.loading) {
                                        return Totals();
                                      } else {
                                        return const SizedBox();
                                      }
                                    }),
                                    const SizedBox(height: 24),
                                    Obx(() {
                                      if (controller.error != '') {
                                        Future.delayed(
                                            const Duration(milliseconds: 500),
                                            () {
                                          Utils.showSnackbar(controller.error);
                                        });
                                      }
                                      if (controller.loading) {
                                        var size =
                                            MediaQuery.of(context).size.height *
                                                0.2;
                                        return Center(
                                          child: SizedBox(
                                            height: size,
                                            width: size,
                                            child:
                                                const CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                AzTheme.red,
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return const DataGrid();
                                      }
                                    }),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: AzTheme.whiteSmoke,
                              height: 56,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 21),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/logo_azape.svg',
                                    width: 30,
                                    height: 30,
                                  ),
                                  const SizedBox(width: 16),
                                  const Text(
                                    '® Desenvolvido por Azape',
                                    style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: AzTheme.blueGray,
                                    ),
                                  ),
                                  const SizedBox(width: 48),
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
                  margin: const EdgeInsets.only(top: 0, left: 0.5, right: 0),
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
                          offset: const Offset(0.0, 0.5),
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
                                  const Text(
                                    'Olá,',
                                    style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: AzTheme.deepBlueGray,
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      controller.userName.value
                                          .split(' ')
                                          .first,
                                      style: const TextStyle(
                                        fontFamily: 'NunitoSans',
                                        color: Color(0xff59666F),
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 16),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AzTheme.red,
                                ),
                                child: const Center(
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
                        const SizedBox(width: 40),
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
