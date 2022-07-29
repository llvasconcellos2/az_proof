part of 'datagrid.dart';

class DataGridHeader extends TableRow {
  final List<String> content;
  final Color evensColor;
  final Color oddsColor;

  factory DataGridHeader({
    content,
    evensColor = AzColors.lightRed,
    oddsColor = AzColors.red,
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
