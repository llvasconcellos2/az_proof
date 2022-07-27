import 'package:az_proof/app/data/models/dashboard_model.dart';

import 'AzApi.dart';

class DashboardProvider {
  final AzApi api = AzApi();

  String get error => api.error;

  Future<DashboardModel> getAll() async {
    try {
      final response = await api.request.get(
        '${api.baseUrl}/dashboard',
      );
      return DashboardModel.fromJson(response.data);
    } catch (e, stacktrace) {
      print(e);
      print(e.runtimeType);
      print(stacktrace);
      return DashboardModel();
    }
  }
}
