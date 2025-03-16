import 'package:dio/dio.dart';

class ApiConfig {
  static const String baseUrl =
      'https://raw.githubusercontent.com/PouriaMoradi021/countries-api/refs/heads/main/countries.json';

  static Dio createDio() {
    return Dio(BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));
  }
}
