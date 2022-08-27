import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naji_shop/logic/controllers/product_controller.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(() {
        if (controller.favoritesList.isEmpty) {
          return buildEmptyFavorites();
        }
        return ListView.separated(
          itemBuilder: (context, index) {
            return buildFavItems(
              id: controller.favoritesList[index].id,
              image: controller.favoritesList[index].image,
              title: controller.favoritesList[index].title,
              price: controller.favoritesList[index].price,
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.grey,
              thickness: 1,
            );
          },
          itemCount: controller.favoritesList.length,
        );
      }),
    );
  }

  Widget buildFavItems({
    required int id,
    required String image,
    required String title,
    required double price,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$ $price",
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                controller.manageFavorites(id);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEmptyFavorites() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset("assets/images/heart.png"),
          ),
          SizedBox(
            height: 20,
            child: Text(
              "Please, Add your favorites products",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
