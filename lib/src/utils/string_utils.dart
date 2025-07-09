class StringUtils {
  static String firstLetterUpper(String s) {
    if (s.length >= 2) return s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
    if (s.length == 1) return s.toUpperCase();
    return s;
  }
}