import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app_manoj/src/constants/api_constants.dart';
import 'package:news_app_manoj/src/network_layer/network_engine.dart';

void main() {
  group('NetworkEngine', () {
    late NetworkEngine networkEngine;

    setUp(() {
      networkEngine = NetworkEngine();
    });

    test('Constructor initializes Dio with correct options', () {
      final dio = networkEngine.getDio();

      // Verify base URL and timeouts
      expect(dio.options.baseUrl, kNewsBaseAPI);
      expect(dio.options.connectTimeout, Duration(seconds: 30));
      expect(dio.options.receiveTimeout, Duration(seconds: 30));
      expect(dio.options.responseType, ResponseType.json);

      // Verify interceptors
      expect(dio.interceptors.length, 2); // Assuming only LogNetworkCalls interceptor is added
    });

    test('getDio returns Dio instance', () {
      final dio = networkEngine.getDio();
      expect(dio, isA<Dio>());
    });
  });
}
