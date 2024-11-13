import 'package:get/get.dart';
import 'base_provider.dart';

class ApiProvider extends BaseProvider {
  Future<Response> fetchCards(String path, int page) async {
    var queryUri = "$path?page=$page&pageSize=10";
    return get(queryUri.toString());
  }

  Future<Response> search(String path, String query) async {
    var queryUri = "$path$query";
    return get(queryUri.toString());
  }
}
