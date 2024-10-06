import 'package:get_x_example/model/product.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    // Correctly cast the URL to Uri
    var response = await client.get(Uri.parse('http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      // Return the parsed list of products
      return productFromJson(jsonString);
    } else {
      // Handle the case where the request fails
      return null;
    }
  }
}
