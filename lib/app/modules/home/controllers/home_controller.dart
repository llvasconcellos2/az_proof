import 'package:get/get.dart';

import '../../../../utils.dart';
import '../../../data/models/dashboard_model.dart';
import '../../../data/preferences/user_preferences.dart';
import '../../../data/providers/dashboard_provider.dart';

class HomeController extends GetxController {
  final user = UserPreferences().obs;
  final userName = ''.obs;
  final DashboardProvider dashboardProvider;
  DashboardModel dashboardData = DashboardModel();

  final _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;

  HomeController(this.dashboardProvider);

  @override
  void onInit() async {
    await getName();
    dashboardProvider.error.listen((error) {
      Utils.showSnackbar(error);
    });
    loading = true;
    dashboardData = await dashboardProvider.getAll();
    loading = false;
    super.onInit();
  }

  Future<void> getName() async {
    userName.value = await user.value.getName();
  }

  Future<DashboardModel> getData() async {
    return await dashboardProvider.getAll();
  }
}
