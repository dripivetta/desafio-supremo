import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:desafio/services/interceptors/loggininterceptors';

final Client client =
    InterceptedClient.build(interceptors: [LoggingInterceptor()]);

const String baseUrl = '';
