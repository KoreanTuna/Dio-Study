import 'package:dio/dio.dart';
import 'package:dio_study/logger.dart';

final Dio dio = Dio(
  BaseOptions(
    contentType: Headers.jsonContentType,
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 3000),
  ),
)..interceptors.add(CustomInterceptor());

class CustomInterceptor extends Interceptor {
  CustomInterceptor();

  // api 요청 보낼때
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    logger.d('[REQUEST] ${options.method}] ${options.uri}');
    return super.onRequest(options, handler);
  }

  // api 응답 받을때
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d(
        '[RESPONSE] ${response.requestOptions.method}] ${response.requestOptions.uri}');
    return super.onResponse(response, handler);
  }

  // api 통신 중 에러 발생했을때
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    logger.e(
        '[ERROR] ${err.requestOptions.method}] ${err.requestOptions.uri}  StatusCode:${err.response?.statusCode}, ${err.message}, ${err.type}');
  }
}
