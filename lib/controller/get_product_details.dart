import 'package:category_product_listing/models/models.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryController extends GetxController {
  var categories = <Category>[].obs;
  var products = <Product>[].obs;
  var isLoading = false.obs;
  var selectedCategoryId = ''.obs;
  var currentPage = 1;
  final curretcategory = '';

  @override
  void onInit() {
    super.onInit();
    fetchCategories(value: '1');
    // Initial API call
    fetchproducts(categoryid: '643c775bff1bf0b233a1b45e');
  }

  Future<void> fetchCategories({required String value}) async {
    isLoading(true);
    var client = http.Client();
    try {
      
      var url = Uri.parse(
          'https://alpha.bytesdelivery.com/api/v3/product/category-products/123/null/1');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Extract and add categories
        if (data['data']['categories'] != null) {
          categories.addAll(
            List<Category>.from(
              data['data']['categories'].map((cat) => Category.fromJson(cat)),
            ),
          );
          print(categories.length);
        }
      } else {
        Get.snackbar("Error", "Failed to load data");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred while fetching data");
    } finally {
      isLoading(false);
      client.close();
    }
  }

  Future<void> fetchproducts({required String categoryid}) async {
    var client = http.Client();
    try {
      var url = Uri.parse(
          'https://alpha.bytesdelivery.com/api/v3/product/category-products/123/${categoryid}/1');
      print(url);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);

        if (data['data']['products'] != null) {
          products.value = List<Product>.from(
            data['data']['products'].map((prod) => Product.fromJson(prod)),
          );
          print(products.length);
        }
      } else {
        Get.snackbar("Error", "Failed to load data");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred while fetching data$e");
      print(e);
    } finally {
      client.close();
    }
  }

  // void selectCategory(String categoryId) {
  //   selectedCategoryId.value = categoryId;
  //   fetchCategories(categoryId: categoryId, value: '');
  // }

  //  void loadMoreProducts() async {
  //   currentPage++;  // Increment the page for pagination
  //   await fetchCategories(categoryId: selectedCategoryId.value);
  // }
}
