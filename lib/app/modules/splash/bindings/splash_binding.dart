import 'package:get/get.dart';
import '../splash.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController(apiRepository: Get.find()));
  }
}
