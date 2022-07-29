part of 'datagrid.dart';

class DataGridPaginationFooter extends StatelessWidget {
  final controller = Get.find<HomeController>();
  DataGridPaginationFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      child: Material(
        color: AzColors.whiteSmoke,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  FeatherIcons.chevronsLeft,
                  size: 24,
                  color: AzColors.red,
                ),
                tooltip: 'Primeira página',
                onPressed: () {
                  controller.pageNumber = 1;
                },
              ),
              const SizedBox(width: 22),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  FeatherIcons.chevronLeft,
                  size: 24,
                  color: AzColors.red,
                ),
                tooltip: 'Página anterior',
                onPressed: () {
                  controller.pageNumber--;
                },
              ),
              const SizedBox(width: 36),
              Obx(() {
                List<Widget> row = [];
                for (var i = 1; i <= controller.totalPages.value; i++) {
                  row.add(MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      width: 32,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: i == controller.pageNumber ? AzColors.red : null,
                        shape: BoxShape.circle,
                      ),
                      child: TextButton(
                        onPressed: () {
                          controller.pageNumber = i;
                        },
                        child: Text(
                          i.toString(),
                          style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: i == controller.pageNumber
                                ? Colors.white
                                : AzColors.gray,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ));
                  if (i != controller.totalPages.value) {
                    row.add(const SizedBox(width: 21));
                  }
                }

                return Row(
                  children: row,
                );
              }),
              const SizedBox(width: 36),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  FeatherIcons.chevronRight,
                  size: 24,
                  color: AzColors.red,
                ),
                tooltip: 'Próxmia página',
                onPressed: () {
                  controller.pageNumber++;
                },
              ),
              const SizedBox(width: 22),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  FeatherIcons.chevronsRight,
                  size: 24,
                  color: AzColors.red,
                ),
                tooltip: 'Última página',
                onPressed: () {
                  controller.pageNumber = controller.totalPages.value;
                },
              ),
              const SizedBox(width: 52),
              Obx(
                () => Text(
                  '${controller.pageNumber} de ${controller.totalPages.value} páginas',
                  style: const TextStyle(
                    fontFamily: 'NunitoSans',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AzColors.gray,
                    height: 1.2,
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                'Linhas por página',
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AzColors.gray,
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
                    color: AzColors.whiteGray,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: Obx(
                    () => DropdownButton<int>(
                      value: controller.recordsPerPage,
                      icon: const Icon(FeatherIcons.chevronDown),
                      style: const TextStyle(
                        fontFamily: 'NunitoSans',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AzColors.gray,
                        height: 1.2,
                      ),
                      onChanged: (int? newValue) {
                        controller.recordsPerPage = newValue!;
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
