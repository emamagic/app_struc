class FunExt {

  static bool equalIgnoreCase(String s1, String s2) => (s1.toLowerCase() == s2.toLowerCase());
  static bool isNullOrEmpty(String s) => s.isEmpty;
  static bool notNullOrEmpty(String s) => !isNullOrEmpty(s);

  static String dateTimeToString(DateTime t) => t.toUtc().toIso8601String();
  static DateTime stringToDateTime(String s) => DateTime.parse(s).toUtc();

  static String durationToString(Duration d) => d.inMicroseconds.toString();
  static Duration stringToDuration(String s) => Duration(microseconds: int.parse(s));
}