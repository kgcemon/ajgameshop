import 'package:ajgameshop/data/models/image_slider_model.dart';
import 'package:ajgameshop/data/network_caller/network_caller.dart';
import 'package:ajgameshop/data/utility/urls.dart';
import 'package:get/get.dart';

class ImageSliderController extends GetxController {
  final List<String> _sliderImageList = [];

  List<String> get sliderImageList => _sliderImageList;

  getImageLoad() async {
    print("hello");
    var response = await NetworkCaller.getRequest(url: Urls.sliderImgUrls);
    var data = sliderImageModel.fromJson(response.responseData);
    _sliderImageList.clear();
    for (int i = 0; i < data.data!.length; i++) {
      _sliderImageList.add(data.data![i].img ?? '');
    }
    update();
  }
}
