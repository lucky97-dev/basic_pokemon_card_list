import 'package:basic_pokemon_card_list/app/modules/home/home.dart';
import 'package:basic_pokemon_card_list/app/modules/home/views/pokemon_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/pokemon_details_binding.dart';
import '../modules/splash/splash.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: Routes.home,
        page: () => PokemonHomeScreen(),
        binding: PokemonHomeBinding()),
    GetPage(
      name: Routes.details,
      page: () => PokemonDetailScreen(),
      binding: PokemonDetailsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
      curve: Curves.ease,
    ),
  ];
}
