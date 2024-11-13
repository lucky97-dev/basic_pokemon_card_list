import 'package:get/get.dart';
import '../../../data/repositories/repositories.dart';
import '../../../routes/routes.dart';

class SplashController extends GetxController {
  bool isHelpVisible = false;
  final ApiRepository apiRepository;

  SplashController({required this.apiRepository});

  @override
  void onReady() async {
    super.onReady();
    await _initializeSettings();
    await navigateBasedOnStatus();
  }

  Future<void> _initializeSettings() async {
    await Future.delayed(const Duration(milliseconds: 2000));
  }

  Future<void> navigateBasedOnStatus() async {
    Get.offAndToNamed(Routes.home);
  }
}
