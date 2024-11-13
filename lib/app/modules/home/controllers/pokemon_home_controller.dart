import 'package:basic_pokemon_card_list/app/data/model/response_model/pokemon_card_response.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/repositories/repositories.dart';

class PokemonHomeController extends GetxController {
  final ApiRepository apiRepository;
  PokemonHomeController({required this.apiRepository});
  final ScrollController scrollController = ScrollController();
  var cards = <PokemonCard>[].obs;
  var oldCardsData = <PokemonCard>[].obs;
  var isLoading = true.obs;
  RxBool isLoadingMore = false.obs;
  RxBool isSearchData = false.obs;
  var page = 1.obs;
  RxBool isSearchView = false.obs;

  @override
  void onInit() {
    fetchCards();
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !isLoadingMore.value) {
        loadMoreCards();
      }
    });
  }

  void fetchCards() async {
    isLoading(true);
    try {
      final res = await apiRepository.fetchCards(page.value);
      if (res.statusCode == 200) {
        cards.clear();
        final newCards = PokemonCardResponse.fromJson(res.body);
        cards.addAll(newCards.data!);
      } else {}
      page.value++;
    } finally {
      isLoading(false);
    }
  }

  Future<void> loadMoreCards() async {
    if (isLoadingMore.value) return;
    isLoadingMore.value = true;

    try {
      var res = await apiRepository.fetchCards(page.value);
      if (res.statusCode == 200) {
        final newCards = PokemonCardResponse.fromJson(res.body);
        cards.addAll(newCards.data!);
        page.value++;
      } else {}
    } finally {
      isLoadingMore.value = false;
    }
  }

  void searchCards(String query) async {
    isLoading(true);
    isSearchData.value = true;
    try {
      final res = await apiRepository.search(query);
      if (res.statusCode == 200) {
        cards.clear();
        page.value = 1;
        final newCards = PokemonCardResponse.fromJson(res.body);
        cards.addAll(newCards.data!);
      } else {}
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
