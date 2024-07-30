import 'package:dio/dio.dart';
import 'package:news_app_manoj/src/constants/api_constants.dart';
import 'network_interceptors.dart';

class NetworkEngine {
  static final NetworkEngine _instance = NetworkEngine._internal();

  NetworkEngine._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: kNewsBaseAPI,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      responseType: ResponseType.json,
    ))
      ..interceptors.addAll([LogNetworkCalls()]);
  }

  factory NetworkEngine() => _instance;

  late final Dio _dio;

  Dio getDio() => _dio;
}