import 'package:az_proof/app/data/models/dashboard_model.dart';
import 'package:get/get.dart';

import '../../../data/preferences/user_preferences.dart';
import '../../../data/providers/dashboard_provider.dart';

class HomeController extends GetxController {
  final user = UserPreferences().obs;
  final userName = ''.obs;
  final DashboardProvider dashboardProvider;
  late DashboardModel dashboardData;

  HomeController(this.dashboardProvider);

  @override
  void onInit() async {
    await getName();
    dashboardData = await dashboardProvider.getAll();
    print(dashboardData.toJson());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getName() async {
    userName.value = await user.value.getName();
  }
}
