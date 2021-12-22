import 'package:dio/dio.dart';
import 'package:ejaratest/common/values/values.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Request {
  static final Request _instance = Request._internal();
  factory Request() => _instance;

  late Dio dio;
  CancelToken cancelToken = CancelToken();

  Request._internal() {
    // BaseOptions, Options, RequestOptions can all be configured with parameters,
    //the priority level increases sequentially,
    // and the parameters can be overridden according to the priority leve
    BaseOptions options = BaseOptions(
      baseUrl: SERVER_API_URL,
      connectTimeout: 20000,
      receiveTimeout: 5000,
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    dio = Dio(options);

// add interceptor
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // do some preprocessing before the request is sent
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      // Do some preprocessing before returning the response data
      return handler.next(response);
    }, onError: (DioError e, handler) {
      // do some preprocessing when the request fails
      ErrorEntity eInfo = createErrorEntity(e);
      // Error message
      EasyLoading.showInfo(eInfo.message.toString());
      // Error interactive handling
      switch (eInfo.code) {
        case 401: // No permission to log in again
          break;
        default:
      }
      return handler.next(e);
    }));
  }

  /// read token
  Map<String, dynamic> getAuthorizationHeader() {
    var headers = <String, dynamic>{
      'Content-Type': 'application/json',
    };
    return headers;
  }

  /// restful get operation
  Future get(String path, {dynamic params, Options? options}) async {
    Options requestOptions = options ?? Options();

    var response = await dio.get(path,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken);
    return response.data;
  }

  /// restful post operation
  Future post(String path, {dynamic params, Options? options}) async {
    Options requestOptions = options ?? Options();
    Map<String, dynamic> _authorization = getAuthorizationHeader();
    if (_authorization.isNotEmpty) {
      requestOptions = requestOptions.copyWith(headers: _authorization);
    }
    var response = await dio.post(path,
        data: params, options: requestOptions, cancelToken: cancelToken);
    return response.data;
  }

  /// restful put operation
  Future put(String path, {dynamic params, Options? options}) async {
    Options requestOptions = options ?? Options();
    Map<String, dynamic> _authorization = getAuthorizationHeader();
    if (_authorization.isNotEmpty) {
      requestOptions = requestOptions.copyWith(headers: _authorization);
    }
    var response = await dio.put(path,
        data: params, options: requestOptions, cancelToken: cancelToken);
    return response.data;
  }

  /// restful patch operation
  Future patch(String path, {dynamic params, Options? options}) async {
    Options requestOptions = options ?? Options();

    Map<String, dynamic> _authorization = getAuthorizationHeader();
    if (_authorization.isNotEmpty) {
      requestOptions = requestOptions.copyWith(headers: _authorization);
    }

    var response = await dio.patch(path,
        data: params, options: requestOptions, cancelToken: cancelToken);

    return response.data;
  }

  /// restful delete operation
  Future delete(String path, {dynamic params, Options? options}) async {
    Options requestOptions = options ?? Options();

    Map<String, dynamic> _authorization = getAuthorizationHeader();
    if (_authorization.isNotEmpty) {
      requestOptions = requestOptions.copyWith(headers: _authorization);
    }
    var response = await dio.delete(path,
        data: params, options: requestOptions, cancelToken: cancelToken);
    return response.data;
  }

  /// restful post form form submission operation
  Future postForm(String path, {dynamic params, Options? options}) async {
    Options requestOptions = options ?? Options();

    Map<String, dynamic> _authorization = getAuthorizationHeader();
    if (_authorization.isNotEmpty) {
      requestOptions = requestOptions.copyWith(headers: _authorization);
    }
    var response = await dio.post(path,
        data: FormData.fromMap(params),
        options: requestOptions,
        cancelToken: cancelToken);
    return response.data;
  }

  /*
   * error
   */
  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        {
          return ErrorEntity(code: -1, message: "Request cancellation");
        }
      case DioErrorType.connectTimeout:
        {
          return ErrorEntity(code: -1, message: "Connection timed out");
        }
      case DioErrorType.sendTimeout:
        {
          return ErrorEntity(code: -1, message: "Sned Tined out");
        }

      case DioErrorType.receiveTimeout:
        {
          return ErrorEntity(code: -1, message: "Response timeout");
        }
      case DioErrorType.other:
        {
          return ErrorEntity(code: -2, message: "Other error");
        }
      case DioErrorType.response:
        {
          try {
            int? errCode = error.response?.statusCode;
            if (errCode == null) {
              return ErrorEntity(code: -2, message: error.message);
            }
            switch (errCode) {
              case 400:
                {
                  return ErrorEntity(
                      code: errCode,
                      message: error.response?.data['message'] ??
                          "Request syntax error");
                }

              case 401:
                {
                  return ErrorEntity(
                      code: errCode,
                      message: error.response?.data['message'] ??
                          "Permission denied");
                }

              case 403:
                {
                  return ErrorEntity(
                      code: errCode,
                      message: error.response?.data['message'] ??
                          "Server refused to execute");
                }
              case 404:
                {
                  return ErrorEntity(
                      code: errCode, message: "can not connect to the server");
                }
              case 405:
                {
                  return ErrorEntity(
                      code: errCode,
                      message: error.response?.data['message'] ??
                          "Request method is forbidden");
                }
              case 500:
                {
                  return ErrorEntity(
                      code: errCode, message: "Server internal error");
                }
              case 502:
                {
                  return ErrorEntity(code: errCode, message: "Invalid request");
                }
              case 503:
                {
                  return ErrorEntity(
                      code: errCode,
                      message:
                          error.response?.data['message'] ?? "Server hung up");
                }
              case 505:
                {
                  return ErrorEntity(
                      code: errCode,
                      message: error.response?.data['message'] ??
                          "Does not support HTTP protocol request");
                }
              default:
                {
                  return ErrorEntity(
                      code: errCode, message: error.response?.data['message']);
                }
            }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: "unknown mistake");
          }
        }
      default:
        {
          return ErrorEntity(code: -1, message: error.message);
        }
    }
  }
}

// exception handling
class ErrorEntity implements Exception {
  int code;
  String? message;
  ErrorEntity({required this.code, this.message});

  @override
  String toString() {
    if (message == null) return "Exception";
    return "Exception: code $code, $message";
  }
}
