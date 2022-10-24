import 'package:cookbook/services/http_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

class WebClient {
  static const String url = 'http://themealdb.com/api/json/v1/';
  static const String apiKey = '1/';
  static const String searchRequest = 'search.php?s=';

  http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
    requestTimeout: const Duration(seconds: 5),
  );
}
