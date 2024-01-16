import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

import '../env/env.dart';

class CustomDio extends DioForBrowser {
  CustomDio()
      : super(
          BaseOptions(
            baseUrl: Env.instance.get('API_URL'),
          ),
        ) {
    interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
