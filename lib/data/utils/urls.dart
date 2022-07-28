class Urls {
  static const String baseUrl = 'https://bank-statement-bff.herokuapp.com';
  //static const String apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';

  /// Transações
  static String statement(int limit, int offset) => '$baseUrl/myStatement/$limit/$offset';
  static String statementDetail(String id) => '$baseUrl/myStatement/detail/$id';
  //static String statementDetail = '$baseUrl/myStatement/detail/49E27207-F3A7-4264-B021-0188690F7D43';
  static String amount() => '$baseUrl/myBalance';

}