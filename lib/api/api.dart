import 'package:dio/dio.dart';
import 'package:test_ecommerce/api/app_config.dart';

class Api {
  final dio = createDio;

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio get createDio {
    var dio = Dio(BaseOptions(
      baseUrl: appConfig,
      receiveTimeout: const Duration(seconds: 60), // 25 seconds
      connectTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio? dio;

  // GetStorage box = GetStorage();

  AppInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers = {
      "Content-Type": "application/json",
      "accept": "*/*",
    };

    return handler.next(options);
  }

  @override
  void onResponse(
    response,
    ResponseInterceptorHandler handler,
  ) {
    print(
      'RESPONSE[${response.statusCode}] => Data: ${response.data}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response!.statusCode}] => PATH: ${err.response!.data}',
    );

    handler.next(err);

    return;
  }
}
