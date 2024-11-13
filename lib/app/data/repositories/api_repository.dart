import 'dart:async';
import 'package:get/get.dart';
import 'repositories.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<Response> fetchCards(int page) async {
    return await apiProvider.fetchCards(ApiConstants.cards, page);
  }

  Future<Response> search(String query) async {
    return await apiProvider.search(ApiConstants.search, query);
  }
}
