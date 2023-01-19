import 'package:dio/dio.dart';

import 'api.dart';

typedef Decoder<T> = T Function(dynamic);

abstract class HttpClientInterface {
  late final Dio _dio = createDio();

  Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: JdApi.head,
      // receiveTimeout: 15000,
      // connectTimeout: 15000,
      // sendTimeout: 15000,
      responseType: ResponseType.json,
    ));

    return dio;
  }

  Future<T?> request<T>(
    JdApi api,
    Decoder<T> decoder, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Response? response;
    try {
      response = await _dio.request(
        api.val,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: options?.copyWith(method: api.method) ??
            Options(method: api.method),
      );
      return decoder.call(response.data['data']);
    } catch (e) {
      return null;
    }
  }
}
