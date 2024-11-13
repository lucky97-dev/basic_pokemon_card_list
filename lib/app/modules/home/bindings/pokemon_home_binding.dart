import 'package:get/get.dart';

import '../home.dart';

class PokemonHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PokemonHomeController>(
        PokemonHomeController(apiRepository: Get.find()));
  }
}
