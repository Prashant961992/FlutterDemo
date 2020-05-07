import 'package:demo/networking/ApiProvider.dart';
import 'dart:async';
import 'package:demo/models/chuckCategories.dart';

class ChuckCategoryRepository {
  ApiProvider _provider = ApiProvider();

  Future<chuckCategories> fetchChuckCategoryData() async {
    final response = await _provider.get("jokes/categories");
    return chuckCategories.fromJson(response);
  }
}