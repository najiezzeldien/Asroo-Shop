import 'package:naji_shop/model/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:naji_shop/model/product_models.dart';
import 'package:naji_shop/utils/my_string.dart';

class CategoryServices {
  static Future<List<String>> getAllCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load category");
    }
  }
}

class AllCategoryServices {
  static Future<List<ProductModel>> getAllCategory(String categoryName) async {
    var response =
        await http.get(Uri.parse('$baseUrl/products/category/$categoryName'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
