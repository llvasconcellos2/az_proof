import 'package:get/get.dart';

import '../../../data/providers/session_provider.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    SessionProvider sessionProvider = SessionProvider();
    Get.lazyPut<LoginController>(() => LoginController(sessionProvider));
  }
}
