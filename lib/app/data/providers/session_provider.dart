import 'package:dio/dio.dart';

import '../preferences/user_preferences.dart';
import 'az_api.dart';

class SessionProvider {
  final prefs = UserPreferences();

  String _error = '';
  String get error => _error;
  final AzApi api = AzApi();

  Future<bool> signInProvider(String email, String password) async {
    try {
      // final response = await api.request.post(
      //   '${api.baseUrl}/session',
      //   data: jsonEncode(
      //     {
      //       "email": email,
      //       "password": password,
      //     },
      //   ),
      // );
      //
      // var user = UserModel.fromJson(response.data);
      //
      // await prefs.deleteUser();
      // await prefs.setUser(user);
      // AzApi.token = user.token;

      return true;
    } on DioError catch (e) {
      _error = e.message;
      return false;
    }
  }
}
