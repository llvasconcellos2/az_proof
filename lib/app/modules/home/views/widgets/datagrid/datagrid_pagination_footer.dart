import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';

import '../../../../../az_theme.dart';

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
        color: AzTheme.whiteSmoke,
        child: Row(
          children: [
            const Icon(
              FeatherIcons.chevronsLeft,
              size: 24,
              color: AzTheme.red,
            ),
            const SizedBox(width: 22),
            const Icon(
              FeatherIcons.chevronLeft,
              size: 24,
              color: AzTheme.red,
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
                      color: AzTheme.gray,
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
                    color: AzTheme.red,
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
                      color: AzTheme.gray,
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
                      color: AzTheme.gray,
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
                      color: AzTheme.blueGray,
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
              color: AzTheme.red,
            ),
            const SizedBox(width: 22),
            const Icon(
              FeatherIcons.chevronsRight,
              size: 24,
              color: AzTheme.red,
            ),
            const SizedBox(width: 52),
            const Text(
              '1 de 10 páginas',
              style: TextStyle(
                fontFamily: 'NunitoSans',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AzTheme.gray,
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
                color: AzTheme.gray,
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
                  color: AzTheme.whiteGray,
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
                    color: AzTheme.gray,
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
