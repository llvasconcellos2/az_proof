import 'package:get/get.dart';

import '../../../data/preferences/user_preferences.dart';

class HomeController extends GetxController {
  final user = UserPreferences().obs;
  final userName = ''.obs;

  @override
  void onInit() async {
    await getName();
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
