import 'package:az_proof/app/data/models/dashboard_model.dart';
import 'package:get/get.dart';

import '../../../data/preferences/user_preferences.dart';
import '../../../data/providers/dashboard_provider.dart';

class HomeController extends GetxController {
  final user = UserPreferences().obs;
  final userName = ''.obs;
  final DashboardProvider dashboardProvider;
  late DashboardModel dashboardData;

  final _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;

  String get error => dashboardProvider.error;

  HomeController(this.dashboardProvider);

  @override
  void onInit() async {
    await getName();
    dashboardData = await dashboardProvider.getAll();
    super.onInit();
  }

  Future<void> getName() async {
    userName.value = await user.value.getName();
  }

  Future<bool> getData() async {
    loading = true;
    dashboardData = await dashboardProvider.getAll();
    loading = false;
    return true;
  }
}
