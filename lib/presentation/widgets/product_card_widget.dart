import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../screens/product_details_screen.dart';
import '../state_holders/category_list_controller.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryListController>(
        builder: (categoryListController) {
      return Visibility(
        visible: categoryListController.inProgress == false,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: categoryListController.cateGoryDataFromapi.isEmpty
            ? Lottie.asset("assets/lottie/noproduct.json")
            : GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categoryListController.cateGoryDataFromapi.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio:
                        MediaQuery.of(context).size.width / 1.5 / 310,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(ProductDetailsScreen(
                        products: categoryListController
                                .cateGoryDataFromapi[index].products ??
                            [],
                        productImg: categoryListController
                            .cateGoryDataFromapi[index].img
                            .toString(),
                        productTitle: categoryListController
                            .cateGoryDataFromapi[index].name
                            .toString(),
                      ));
                    },
                    child: Card(
                      elevation: 10,
                      surfaceTintColor: Colors.white,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 10,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: CachedNetworkImage(
                                    imageUrl: categoryListController
                                            .cateGoryDataFromapi[index].img ??
                                        '',
                                    placeholder: (context, url) => Lottie.asset(
                                        "assets/lottie/imageloading.json"),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(
                                  '${categoryListController.cateGoryDataFromapi[index].name}',
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      );
    });
  }
}
