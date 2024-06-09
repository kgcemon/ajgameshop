import 'package:ajgameshop/data/models/image_slider_model.dart';
import 'package:ajgameshop/data/network_caller/network_caller.dart';
import 'package:ajgameshop/data/utility/urls.dart';
import 'package:get/get.dart';

class ImageSliderController extends GetxController {
  List<String> sliderImageList = [];

  getImageLoad() async {
    print("hello");
    var response = await NetworkCaller.getRequest(url: Urls.sliderImgUrls);
    var data = sliderImageModel.fromJson(response.responseData);
    sliderImageList.clear();
    for (int i = 0; i < data.data!.length; i++) {
      sliderImageList.add(data.data![i].img ?? '');
    }
    update();
  }
}
