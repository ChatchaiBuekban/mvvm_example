import 'package:flutter/foundation.dart';
import 'package:mvvm_example/data_class/food_data.dart';
import 'package:mvvm_example/models/food_model.dart';

class SearchFoodProvider with ChangeNotifier {
  List<Food> _foodResults = [];
  List<Food> get getFoodResults => _foodResults;
  bool _isLoading = false;
  get isLoading => _isLoading;
  set isLoading(value) => _isLoading = value;

  set setFoodResults(foodResults) => _foodResults = foodResults;

  void search(String text) async {
    _isLoading = true;
    notifyListeners();
    var result = await FoodModel.search(text);
    _foodResults = result ?? [];
    _isLoading = false;
    notifyListeners();
  }
}
