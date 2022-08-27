import 'package:get/get.dart';
import 'package:naji_shop/model/product_models.dart';
import 'package:naji_shop/services/category_services.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var isCategoryLoading = false.obs;
  var isAllcategory = false.obs;
  var categoryList = <ProductModel>[].obs;
  List<String> imageCategory = [
    "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
    "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
  ];
  @override
  void onInit() {
    super.onInit();
    getCategorys();
  }

  void getCategorys() async {
    var categoryName = await CategoryServices.getAllCategory();
    try {
      if (categoryName.isNotEmpty) {
        isCategoryLoading.value = true;
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading.value = false;
    }
  }

  getAllCategorys(String categoryName) async {
    isAllcategory.value = true;
    categoryList.value = await AllCategoryServices.getAllCategory(categoryName);

    isAllcategory.value = false;
  }

  getCategoryIndex(int index) async {
    var categoryAllNames = await getAllCategorys(categoryNameList[index]);
    if (categoryAllNames != null) {
      categoryList.value = categoryAllNames;
    }
  }
}
