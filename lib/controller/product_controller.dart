import 'package:get/get.dart';
import 'package:get_x_example/service/remote_services.dart';

import '../model/product.dart';

class ProductController extends GetxController {
  // var productList = List<Product>().obs;
  var productList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    isLoading(true);
    try {
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
