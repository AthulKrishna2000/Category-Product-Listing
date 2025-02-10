import 'package:category_product_listing/controller/get_product_details.dart';
import 'package:category_product_listing/utils/appconst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 0;
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appMainbackColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 224, 166),
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back_ios,
          size: 18,
        ),
        title: const Text('Vegetables & Fruits'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (categoryController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              // if (categoryController.categories.isEmpty) {
              //   return Center(child: Text('No categories available'));
              // }
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 5),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: AppConstant.appMainconttainerColor,
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(10))),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      child: ListView.builder(
                        itemCount: categoryController.categories.length,
                        itemBuilder: (context, index) {
                          final category = categoryController.categories[index];
                          bool isSelected = index == selectedIndex;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                                categoryController.fetchproducts(
                                    categoryid: category.id);
                              });
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, left: 3),
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                    decoration: BoxDecoration(
                                                        color: isSelected
                                                            ? Colors.green
                                                                .withOpacity(
                                                                    0.3) // Highlight selected item
                                                            : Colors
                                                                .transparent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: isSelected
                                                            ? Border.all(
                                                                color: Colors
                                                                    .green,
                                                                width: 2)
                                                            : Border.all(
                                                                color: Colors
                                                                    .transparent),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                category
                                                                    .image))),
                                                  ),
                                                  // CircleAvatar(
                                                  //   radius: 25,
                                                  //   child: Image.network(
                                                  //       category.image),
                                                  // ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    category.title,
                                                    style: appstyle(
                                                        10,
                                                        AppConstant
                                                            .apptextColor,
                                                        FontWeight.w500),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                        decoration: BoxDecoration(
                                            color: isSelected
                                                ? Colors.green[
                                                    700] // Highlight selected item
                                                : Colors.transparent,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10))),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: AppConstant.appMainconttainerColor,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(10))),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.sizeOf(context).width * 0.8 - 5,
                      child: GridView.builder(
                        itemCount: categoryController.products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                        ),
                        itemBuilder: (context, index) {
                          final products = categoryController.products[index];
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            width: MediaQuery.of(context).size.width * 0.5,
                            // color: Colors.amber,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.18,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        decoration: BoxDecoration(
                                            color: AppConstant
                                                .appMainconttainerColor,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    products.images[0]),
                                                fit: BoxFit.fill),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20))),
                                      ),
                                      Positioned(
                                        bottom: -6,
                                        right: -6,
                                        child: Container(
                                          height: 40,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color: Colors.green.shade700),
                                            color: AppConstant
                                                .appMainconttainerColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'ADD',
                                              style: TextStyle(
                                                  color: Colors.green.shade700,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(products.title,
                                                style: appstyle(
                                                    15,
                                                    AppConstant.apptextColor,
                                                    FontWeight.bold)),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              NumberFormat.simpleCurrency(
                                                      locale: 'en_IN')
                                                  .format(
                                                      products.discountPrice),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text(
                                              'MRP',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              NumberFormat.simpleCurrency(
                                                      locale: 'en_IN')
                                                  .format(products.price),
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}
