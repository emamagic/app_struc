import 'package:app_struc/core/constants/general.dart';
import 'package:app_struc/core/exceptions/network_exceptions.dart';
import 'package:app_struc/data/network/rest/dio/dio_provider.dart';
import 'package:app_struc/data/preferences/pref.dart';
import 'package:app_struc/data/preferences/pref_key.dart';
import 'package:dio/dio.dart';

class AuthenticationInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var accessToken = await Pref.get(PrefKey.ACCESS_TOKEN) as String;
    options.headers["Authorization"] = "Bearer $accessToken";
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if(response.statusCode != 401)
    super.onResponse(response, handler);
  }


  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if(err.response!.statusCode == 401) {
      getNewToken(err, handler);
    }
    super.onError(err, handler);
  }

  getNewToken(DioError error, ErrorInterceptorHandler handler) async {
    try {
      await _lockDio();
      var refreshToken = await Pref.get(PrefKey.REFRESH_TOKEN) as String;
      var dio = Dio();
      var response = await dio.post('',
          options: Options(
              headers: {"Refresh": refreshToken}
          ));
      await _setNewToken(response);
      await _unLocDio();
      await _requestAgainLastApiCall(error, handler);
    } catch (e) {
      print(NetworkExceptions.getDioException(e));
    }
  }

  _setNewToken(response) async {
    await Pref.set(PrefKey.ACCESS_TOKEN, response.headers['set-cookie']!.first.substring(12).split(';').first);
    await Pref.set(PrefKey.REFRESH_TOKEN, response.headers['set-cookie']!.last.substring(13).split(';').first);
  }

  _requestAgainLastApiCall(DioError error, ErrorInterceptorHandler handler) async {
    try {
      RequestOptions options = error.requestOptions;
      var response = await DioProvider().dio.request(
          "$BASE_URL${options.path}",
          options: Options(
              method: options.method
          ),
          data: options.data,
          queryParameters: options.queryParameters,
          onReceiveProgress: options.onReceiveProgress,
          onSendProgress: options.onSendProgress,
          cancelToken: options.cancelToken);
      handler.resolve(response);
    } catch (e) {
      print("request again ${NetworkExceptions.getDioException(e)}");
    }

  }

  _lockDio() async {
    DioProvider().dio.interceptors.requestLock.lock();
    DioProvider().dio.interceptors.responseLock.lock();
  }

  _unLocDio() async {
    DioProvider().dio.interceptors.requestLock.unlock();
    DioProvider().dio.interceptors.responseLock.unlock();
  }

}