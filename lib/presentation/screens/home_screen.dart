import 'package:ajgameshop/presentation/state_holders/image_slider_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lecle_flutter_carousel_pro/lecle_flutter_carousel_pro.dart';
import 'package:lottie/lottie.dart';
import '../widgets/app_drawer_menu.dart';
import '../widgets/appbar.dart';
import '../widgets/product_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawerMenu(),
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              GetBuilder<ImageSliderController>(
                builder: (controller) => ImageSliderWidget(
                    sliderImagesList: controller.sliderImageList),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Popular Games',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              const ProductCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageSliderWidget extends StatelessWidget {
  const ImageSliderWidget({super.key, required this.sliderImagesList});

  final List<String> sliderImagesList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: SizedBox(
        height: 140,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: sliderImagesList.isEmpty
              ? Center(child: Lottie.asset("assets/lottie/imageloading.json"))
              : Carousel(
                  boxFit: BoxFit.cover,
                  dotBgColor: Colors.transparent,
                  dotColor: Colors.white,
                  images: sliderImagesList
                      .map(
                        (url) => ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: url,
                            placeholder: (context, url) =>
                                Lottie.asset("assets/lottie/imageloading.json"),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                      .toList(),
                ),
        ),
      ),
    );
  }
}
