import 'package:http/http.dart' as http;
import 'package:naji_shop/model/product_models.dart';
import 'package:naji_shop/utils/my_string.dart';

class ProductServices {
  static Future<List<ProductModel>> getAllProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
