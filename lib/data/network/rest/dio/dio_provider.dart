import 'package:app_struc/data/network/rest/interceptors/authentication_interceptor.dart';
import 'package:app_struc/data/network/rest/interceptors/logging_interceptor.dart';
import 'package:app_struc/data/network/rest/services/rest_provider.dart';
import 'package:dio/dio.dart';

class DioProvider {
  late Dio dio;
  late RestProvider restProvider;
  String? accessToken;
  static final DioProvider _instance = DioProvider._internal();

  factory DioProvider() => _instance;

  DioProvider._internal() {
    dio = Dio(
    BaseOptions(
    connectTimeout: 20000,
    receiveTimeout: 20000
    )
    )..interceptors.addAll([LoggingInterceptor(), AuthenticationInterceptor()]);
        restProvider = RestProvider(dio);
    }

}