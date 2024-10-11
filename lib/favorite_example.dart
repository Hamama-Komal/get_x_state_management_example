import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteExample extends StatefulWidget {
  const FavoriteExample({super.key});

  @override
  State<FavoriteExample> createState() => _FavoriteExampleState();
}

class _FavoriteExampleState extends State<FavoriteExample> {
  FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Favorite List"),
        ),
        body: ListView.builder(
            itemCount: favoriteController.fruitsList.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                title: Text(favoriteController.fruitsList[index].toString()),
                trailing: Obx(
                  () => Icon(
                    Icons.favorite,
                    color: favoriteController.favList.contains(
                            favoriteController.fruitsList[index].toString())
                        ? Colors.red
                        : Colors.white,
                  ),
                ),
                onTap: () {
                  if (favoriteController.favList.contains(
                      favoriteController.fruitsList[index].toString())) {
                    favoriteController.removeFromFavorite(
                        favoriteController.fruitsList[index].toString());
                  } else {
                    favoriteController.addToFavorite(
                        favoriteController.fruitsList[index].toString());
                  }
                },
              ));
            }));
  }
}

class FavoriteController extends GetxController {
  RxList<String> fruitsList =
      ['Apple', 'Banana', 'Orange', 'Melon', 'WaterMelon', 'Grapes'].obs;
  RxList<dynamic> favList = [].obs;

  void removeFromFavorite(value) {
    favList.remove(value);
  }

  void addToFavorite(value) {
    favList.add(value);
  }
}
