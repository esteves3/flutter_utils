extension StringExtension on String {
  String capitalize() {
    int i = 0;
    var whiteSpaces = "";
    while (this[i] == " ") {
      i++;
      whiteSpaces += " ";
    }
    return "$whiteSpaces${this[i].toUpperCase()}${substring(i + 1)}";
  }

  String toCamelCase() {
    String res = "";
    for (var i = 0; i < length; i++) {
      if (i == 0 || this[i - 1] == " ") {
        res += this[i].toUpperCase();
      } else {
        res += this[i].toLowerCase();
      }
    }
    return res;
  }

  String removeDiacriticsFunction(String input) {
    return input
        .replaceAll('á', 'a')
        .replaceAll('Á', 'A')
        .replaceAll('à', 'a')
        .replaceAll('À', 'A')
        .replaceAll('â', 'a')
        .replaceAll('Â', 'A')
        .replaceAll('ä', 'a')
        .replaceAll('Ä', 'A')
        .replaceAll('ã', 'a')
        .replaceAll('Ã', 'A')
        .replaceAll('å', 'a')
        .replaceAll('Å', 'A')
        .replaceAll('æ', 'ae')
        .replaceAll('Æ', 'AE')
        .replaceAll('ç', 'c')
        .replaceAll('Ç', 'C')
        .replaceAll('é', 'e')
        .replaceAll('É', 'E')
        .replaceAll('è', 'e')
        .replaceAll('È', 'E')
        .replaceAll('ê', 'e')
        .replaceAll('Ê', 'E')
        .replaceAll('ë', 'e')
        .replaceAll('Ë', 'E')
        .replaceAll('í', 'i')
        .replaceAll('Í', 'I')
        .replaceAll('ì', 'i')
        .replaceAll('Ì', 'I')
        .replaceAll('î', 'i')
        .replaceAll('Î', 'I')
        .replaceAll('ï', 'i')
        .replaceAll('Ï', 'I')
        .replaceAll('ñ', 'n')
        .replaceAll('Ñ', 'N')
        .replaceAll('ó', 'o')
        .replaceAll('Ó', 'O')
        .replaceAll('ò', 'o')
        .replaceAll('Ò', 'O')
        .replaceAll('ô', 'o')
        .replaceAll('Ô', 'O')
        .replaceAll('ö', 'o')
        .replaceAll('Ö', 'O')
        .replaceAll('õ', 'o')
        .replaceAll('Õ', 'O')
        .replaceAll('ø', 'o')
        .replaceAll('Ø', 'O')
        .replaceAll('œ', 'oe')
        .replaceAll('Œ', 'OE')
        .replaceAll('ß', 'ss')
        .replaceAll('ú', 'u')
        .replaceAll('Ú', 'U')
        .replaceAll('ù', 'u')
        .replaceAll('Ù', 'U')
        .replaceAll('û', 'u')
        .replaceAll('Û', 'U')
        .replaceAll('ü', 'u')
        .replaceAll('Ü', 'U')
        .replaceAll('ÿ', 'y')
        .replaceAll('Ÿ', 'Y');
  }
}
