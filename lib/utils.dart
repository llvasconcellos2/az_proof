class Utils {
  static String cpfCnpjFormat(String docNumber) {
    var badChars = RegExp(r'/[^\d]/g');
    docNumber = docNumber.replaceAll(badChars, "");
    if (docNumber.length == 11) {
      var mask = RegExp(
          r'(?<First>\d{3})(?<Second>\d{3})(?<Third>\d{3})(?<Digit>\d{2})');
      var matches = mask.firstMatch(docNumber);
      return '${matches?.namedGroup('First')}.${matches?.namedGroup('Second')}.${matches?.namedGroup('Third')}-${matches?.namedGroup('Digit')}';
    } else if (docNumber.length == 14) {
      var mask = RegExp(
          r'(?<First>\d{2})(?<Second>\d{3})(?<Third>\d{3})(?<Forth>\d{4})(?<Digit>\d{2})');
      var matches = mask.firstMatch(docNumber);
      return '${matches?.namedGroup('First')}.${matches?.namedGroup('Second')}.${matches?.namedGroup('Third')}/${matches?.namedGroup('Forth')}-${matches?.namedGroup('Digit')}';
    } else {
      return docNumber;
    }
  }
}
