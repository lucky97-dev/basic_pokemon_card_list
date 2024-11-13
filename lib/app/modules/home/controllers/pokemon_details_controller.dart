import 'package:basic_pokemon_card_list/app/data/model/response_model/pokemon_card_response.dart';
import 'package:get/get.dart';

import '../../../data/repositories/repositories.dart';

class PokemonDetailsController extends GetxController {
  final ApiRepository apiRepository;
  PokemonDetailsController({required this.apiRepository});

  PokemonCard pokemonCard = Get.arguments! as PokemonCard;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
