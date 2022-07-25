import 'dart:convert';
import 'http_service.dart';
import 'package:http/http.dart' as http;

class HttpServiceImpl implements HttpService {
  @override
  Future<dynamic> get(String url) async {
    final defaultHeaders = ({
      'token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c'
    });

    try {
      Future<http.Response> futureResponse =
          http.get(Uri.parse(url), headers: defaultHeaders);
      var response = await futureResponse.timeout(const Duration(minutes: 10));
      // ignore: avoid_print
      print(response.body);
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
