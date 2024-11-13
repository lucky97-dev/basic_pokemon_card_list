import 'package:get/get.dart';

import '../controllers/pokemon_details_controller.dart';

class PokemonDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PokemonDetailsController>(
        PokemonDetailsController(apiRepository: Get.find()));
  }
}
