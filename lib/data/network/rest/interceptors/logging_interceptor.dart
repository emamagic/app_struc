import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(
        'REQUEST ${options.method} => PATH: ${options.path} DATA: ${options.data}'
            'HEADER ${options.headers}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE${response.statusCode} => PATH: ${response.requestOptions.path}'
          ' DATA: ${response.toString()} STATUS:${response.statusMessage}'
          'HEADER ${response.headers}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        'ERROR${err.error} => PATH: ${err.requestOptions.path} CODE: ${err.response?.statusCode}');
    return super.onError(err, handler);
  }



}
