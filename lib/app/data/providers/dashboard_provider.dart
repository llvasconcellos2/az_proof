import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../models/dashboard_model.dart';
import 'az_api.dart';

class DashboardProvider {
  final AzApi api = AzApi();

  RxString get error => api.error;

  Future<DashboardModel> getAll() async {
    try {
      final response = await api.request.get(
        '${api.baseUrl}/dashboard',
      );
      return DashboardModel.fromJson(response.data);
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print(e);
        print(e.runtimeType);
        print(stacktrace);
      }
      return DashboardModel();
    }
  }
}
