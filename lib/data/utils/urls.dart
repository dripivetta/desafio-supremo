class Urls {
  static const String baseUrl = 'https://bank-statement-bff.herokuapp.com';
  //static const String apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';

  /// Transações
  static String statement(int limit, int offset) => '$baseUrl/myStatement/$limit/$offset';
  //static String statementDetail(int id) => '$baseUrl/myStatement/detail/49E27207-F3A7-4264-B021-0188690F7D43';
  static String statementDetail = '$baseUrl/myStatement/detail/49E27207-F3A7-4264-B021-0188690F7D43';
  static String amount() => '$baseUrl/myBalance';


  // static String movieRecommendations(int id) =>
  //     '$baseUrl/movie/$id/recommendations?$apiKey';
  // static String movieTrailer(int id) => '$baseUrl/movie/$id/videos?$apiKey';
  // static String movieCredits(int id) => '$baseUrl/movie/$id/credits?$apiKey';

  // /// Image
  // static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  // static String imageUrl(String path) => '$baseImageUrl$path';
  // static String movieImages(int id) =>
  //     '$baseUrl/movie/$id/images?$apiKey&language=en-US&include_image_language=en,null';
}