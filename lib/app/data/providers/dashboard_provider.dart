import 'package:az_proof/app/data/models/dashboard_model.dart';
import 'package:dio/dio.dart';

import '../preferences/user_preferences.dart';

class DashboardProvider {
  final baseUrl = 'http://150.230.64.79:9393/proof';
  final request = Dio();
  final userPrefs = UserPreferences();

  final options = Options(
    followRedirects: false,
    validateStatus: (status) {
      return status! < 500;
    },
    headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer '},
  );

  String _error = '';
  String get error => _error;

  Future<DashboardModel> getAll() async {
    try {
      final response = await request.post(
        '$baseUrl/dashboard',
        options: options,
      );

      if (response.statusCode == 200) {
        return DashboardModel.fromJson(response.data);
      } else {
        _error = response.data['message'];
        return DashboardModel();
      }
    } catch (e) {
      _error = e.toString();
      return DashboardModel();
    }
  }
}
