import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PreferencesLocalGateway {
  PreferencesLocalGateway({
    required this.flutterSecureStorage,
  });

  static const tokenKey = 'token';
  static const temporaryTokenKey = 'temporaryToken';
  static const refreshTokenKey = 'refreshToken';
  static const pinCodeKey = 'pinCode';

  static const rememberMeStatusKey = 'rememberMeStatusKey';
  static const phoneNumberKey = 'phoneNumberKey';
  static const biometricAuthConfirmedStatusKey = 'biometricAuthConfirmedStatusKey';
  static const biometricAuthTypeKey = 'biometricAuthTypeKey';

  FlutterSecureStorage flutterSecureStorage;

  Future<String?> getToken() async {
    String? token = await flutterSecureStorage.read(key: tokenKey);

    if (token == null) {
      return null;
    } else {
      return 'Bearer ' + token;
    }
  }

  Future<void> setToken(String? apiToken) {
    return flutterSecureStorage.write(key: tokenKey, value: apiToken);
  }

  Future<String?> getTemporaryToken() async {
    return flutterSecureStorage.read(key: temporaryTokenKey);
  }

  Future<void> setTemporaryToken(String? token) {
    return flutterSecureStorage.write(key: temporaryTokenKey, value: token);
  }

  Future<String?> getRefreshToken() async {
    String? token = await flutterSecureStorage.read(key: refreshTokenKey);

    if (token == null) {
      return null;
    } else {
      return 'Bearer ' + token;
    }
  }

  Future<void> setRefreshToken(String? refreshToken) {
    return flutterSecureStorage.write(key: refreshTokenKey, value: refreshToken);
  }

  Future<void> setRememberMeStatus(bool? status) {
    return flutterSecureStorage.write(key: rememberMeStatusKey, value: status.toString());
  }

  Future<bool> getRememberMeStatus() async {
    String? status = await flutterSecureStorage.read(key: rememberMeStatusKey);

    if (status == 'true') {
      return true;
    } else {
      return false;
    }
  }

  Future<void> setBiometricAuthConfirmedStatus(bool? status) {
    return flutterSecureStorage.write(key: biometricAuthConfirmedStatusKey, value: status.toString());
  }

  Future<bool> getBiometricAuthConfirmedStatus() async {
    String? status = await flutterSecureStorage.read(key: biometricAuthConfirmedStatusKey);

    if (status == 'true') {
      return true;
    } else {
      return false;
    }
  }

  Future<void> setPhoneNumber(String? phoneNumber) async {
    return flutterSecureStorage.write(key: phoneNumberKey, value: phoneNumber);
  }

  Future<String?> getPhoneNumber() async {
    return flutterSecureStorage.read(key: phoneNumberKey);
  }

  Future<void> setPinCode(String? pinCode) async {
    return flutterSecureStorage.write(key: pinCodeKey, value: pinCode);
  }

  Future<String?> getPinCode() async {
    return flutterSecureStorage.read(key: pinCodeKey);
  }
}
