import 'package:mvvm_example/data_class/food_data.dart';
import 'package:openfoodfacts/model/parameter/SearchTerms.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/QueryType.dart';

class FoodModel {
  static Future<List<Food>?>? search(String keyword) async {
    SearchResult result = await OpenFoodAPIClient.searchProducts(
        null,
        ProductSearchQueryConfiguration(
          parametersList: <Parameter>[
            const SortBy(option: SortOption.PRODUCT_NAME),
            SearchTerms(terms: [keyword]),
          ],
          language: OpenFoodFactsLanguage.THAI,
          country: OpenFoodFactsCountry.THAILAND,
        ),
        queryType: QueryType.PROD);

    if (result.products != null) {
      print(result.products);
      return result.products
          ?.map<Food>((e) => Food(
              barCodeData: e.barcode,
              cal: e.nutriments?.energyKcal,
              name: e.productName ?? e.genericName ?? e.labels ?? e.brands,
              imagrUrl: e.imageFrontUrl ??
                  e.imageFrontSmallUrl ??
                  e.imagePackagingUrl))
          .toList();
    }
    return [];
  }
}
