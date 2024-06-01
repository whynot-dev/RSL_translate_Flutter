import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ru_sign_lang_translate/app/navigation/navigation_type.dart';
import 'package:ru_sign_lang_translate/data/gateways/local/preferences_local_gateway.dart';
import 'package:ru_sign_lang_translate/di/injection.dart';

class DioHelper {
  static String getBaseUrl({String? domain}) {
    String _domain = domain ?? defaultDomain;
    return 'https://$_domain/api/';
  }

  static const defaultDomain = 'core.justdoluck.ru';
  static Duration timeout = Duration(milliseconds: 30000);

  static Dio getAuthDio() {
    Dio dio = Dio()
      ..interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ))
      ..options.receiveDataWhenStatusError = true
      ..options.baseUrl = getBaseUrl()
      ..options.sendTimeout = timeout
      ..options.connectTimeout = timeout
      ..options.receiveTimeout = timeout;
    return dio;
  }

  static Dio getDio({
    required PreferencesLocalGateway preferencesLocalGateway,
    required GlobalKey<NavigatorState> navigatorKey,
    bool needAuthorization = true,
  }) {
    Dio dio = Dio()
      ..options.headers = {"Accept": "application/json"}
      ..options.receiveDataWhenStatusError = true
      ..options.baseUrl = getBaseUrl()
      ..options.sendTimeout = timeout
      ..options.connectTimeout = timeout
      ..options.receiveTimeout = timeout;
    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
          if(needAuthorization){
            String token = await preferencesLocalGateway.getToken() ?? '';
            if (!options.headers.containsKey('Authorization')) {
              options.headers.addAll({'Authorization': token});
            }
          }
          handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) async {
          handler.next(response);
        },
        onError: (DioError error, ErrorInterceptorHandler handler) async {
        },
      ),
    );
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
    return dio;
  }
}
