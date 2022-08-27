import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naji_shop/model/product_models.dart';
import 'package:naji_shop/view/widgets/product_details/add_cart.dart';
import 'package:naji_shop/view/widgets/product_details/clothes_info.dart';
import 'package:naji_shop/view/widgets/product_details/images_sliders.dart';
import 'package:naji_shop/view/widgets/product_details/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImagesSliders(
                imageUrl: productModel.image,
              ),
              ClothesInfo(
                rate: productModel.rating.rate,
                title: productModel.title,
                productId: productModel.id,
                description: productModel.description,
              ),
              const SizeList(),
              AddCart(
                price: productModel.price,
                productModel: productModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
