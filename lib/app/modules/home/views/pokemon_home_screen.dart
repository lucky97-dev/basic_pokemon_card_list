import 'package:basic_pokemon_card_list/app/modules/home/controllers/pokemon_home_controller.dart';
import 'package:basic_pokemon_card_list/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PokemonHomeScreen extends GetView<PokemonHomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: controller.isSearchView.value
            ? AppBar(
                backgroundColor: const Color.fromARGB(135, 237, 217, 155),
                title: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Pokémon',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black54),
                        ),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (query) => controller.searchCards(query),
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                        autofocus: true,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.isSearchView.value = false;

                        if (controller.isSearchData.value) {
                          controller.isSearchData.value = false;
                          controller.page.value = 1;
                          controller.fetchCards();
                        }
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              )
            : AppBar(
                title: const Text("Pokémon"),
                backgroundColor: const Color.fromARGB(135, 237, 217, 155),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      size: 22,
                    ),
                    onPressed: () {
                      controller.isSearchView.value = true;
                    },
                  ),
                ],
              ),
        body: Obx(() {
          if (controller.isLoading.value)
            return Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
            ));

          return controller.cards.length > 0
              ? GridView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.isLoadingMore.value
                      ? controller.cards.length + 1
                      : controller.cards.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .63,
                  ),
                  itemBuilder: (context, index) {
                    if (index < controller.cards.length) {
                      final card = controller.cards[index];
                      return GestureDetector(
                        onTap: () =>
                            Get.toNamed(Routes.details, arguments: card),
                        child: Card(
                          child: Column(
                            children: [
                              CachedNetworkImage(imageUrl: card.images.small),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  card.name,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.yellow),
                          ),
                        ),
                      );
                    }
                  },
                )
              : Center(
                  child: Text("Not Found Pokémon Card"),
                );
        }),
      ),
    );
  }
}
