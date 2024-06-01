// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:ru_sign_lang_translate/domain/entities/network/request/check_code_body.dart';
// import 'package:ru_sign_lang_translate/domain/entities/network/request/login_body.dart';
// import 'package:ru_sign_lang_translate/domain/entities/network/request/recovery_password_body.dart';
// import 'package:ru_sign_lang_translate/domain/entities/network/request/token_body.dart';
//
// part 'authorization_remote_gateway.g.dart';
//
// @RestApi()
// abstract class AuthorizationRemoteGateway {
//   factory AuthorizationRemoteGateway({required Dio dio, String? baseUrl}) {
//     final apiClient = _AuthorizationRemoteGateway(dio, baseUrl: baseUrl);
//     return apiClient;
//   }
//
//
//   @POST('/auth/resend')
//   Future<HttpResponse<dynamic>> resendCode({
//     @Body() required TokenBody body,
//   });
//
//   @POST('/auth/restoring')
//   Future<HttpResponse<dynamic>> recoveryPassword({
//     @Body() required RecoveryPasswordBody body,
//   });
//
//   @POST('/auth/refresh')
//   Future<HttpResponse<RefreshTokenResponse>> refreshToken({
//     @Header('Authorization') required String refreshToken,
//     @Header('Accept') String accept = 'application/json',
//   });
// }