import 'package:flutter/material.dart';
import 'package:get_x_example/controller/product_controller.dart';
import 'package:get_x_example/widgets/product_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.chevron_left,
          size: 28,
          color: Colors.black,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.shopping_cart,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                    child: Text("ShopX",
                        style: GoogleFonts.balooBhai2(
                            textStyle: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)))),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.list,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.grid_view_outlined,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if(productController.isLoading.value)
                return Center(child: CircularProgressIndicator(),);
              else {
                return StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: productController.productList.length,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                itemBuilder: (context, index) {
                  return ProductTile(productController.productList[index]);
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              );
              }
            }),
          ),
        ],
      ),
    );
  }
}
