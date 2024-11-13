import 'package:basic_pokemon_card_list/app/modules/home/controllers/pokemon_details_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PokemonDetailScreen extends GetView<PokemonDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.pokemonCard.name),
        backgroundColor: const Color.fromARGB(135, 237, 217, 155),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Hero(
                  tag: controller.pokemonCard.id,
                  child: CachedNetworkImage(
                      imageUrl: controller.pokemonCard.images.small),
                ),
              ),
              SizedBox(height: 16),
              Text("Set",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListTile(
                title: Text(controller.pokemonCard.set.name),
                subtitle:
                    Text("PtcgoCode: ${controller.pokemonCard.set.ptcgoCode}"),
              ),
              Text("Type: ${controller.pokemonCard.types.join(', ')}",
                  style: TextStyle(fontSize: 16)),
              Text("Artist: ${controller.pokemonCard.artist}",
                  style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              Text("Attacks",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ...controller.pokemonCard.attacks.map((attack) => ListTile(
                    title: Text(attack.name),
                    subtitle: Text("Damage: ${attack.damage}"),
                  )),
              SizedBox(height: 16),
              Text("Weaknesses",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ...controller.pokemonCard.weaknesses.map((weakness) => ListTile(
                    title: Text(weakness.type),
                    subtitle: Text("Value: ${weakness.value}"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
