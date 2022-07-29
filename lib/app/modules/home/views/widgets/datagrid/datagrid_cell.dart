import 'package:flutter/material.dart';

import '../../../../../az_theme.dart';

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
    this.textColor = AzTheme.deepBlueGray,
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
      color: isHeader ? AzTheme.red : AzTheme.whiteSmoke,
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
