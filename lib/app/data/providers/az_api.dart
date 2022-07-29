import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

import '../preferences/user_preferences.dart';

class AzApi {
  final baseUrl = 'http://150.230.64.79:9393/proof';

  final options = BaseOptions(
    followRedirects: false,
    validateStatus: (status) {
      return status! < 500;
    },
    headers: {'Content-Type': 'application/json'},
  );

  RxString error = ''.obs;

  static String? _token;
  static set token(String? value) {
    if (value != null && value.isNotEmpty) {
      _token = value;
    }
  }

  late final Dio request;

  AzApi() {
    getTokenFromUserPreferences();
    request = Dio(options);
    setInterceptors();
  }

  void getTokenFromUserPreferences() {
    var userPreferences = UserPreferences();
    userPreferences.getToken().then((value) {
      _token = value;
    });
  }

  void setInterceptors() {
    request.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (_token != null) {
        options = options.copyWith(
          headers: Map<String, dynamic>.from(options.headers)
            ..addAll({'Authorization': 'Bearer $_token'}),
        );
      }
      handler.next(options);
    }, onResponse: (response, handler) {
      if (response.statusCode == 200) {
        return handler.next(response);
      } else if (response.statusCode == 404) {
        // When statusCode is 400 response is HTML
        error.value = extractMessageFromHTML(response.data);
      } else {
        if (response.data['error']) {
          error.value = response.data['message'];
        }
      }
      handler.reject(DioError(
        error: error.value,
        requestOptions: response.requestOptions,
        type: DioErrorType.response,
      ));
    }, onError: (DioError e, handler) {
      error.value = e.message;
      return handler.next(e); //continue
    }));
  }

  String extractMessageFromHTML(String html) {
    var document = parse(html);
    return document.getElementsByTagName('pre').first.innerHtml;
  }
}
