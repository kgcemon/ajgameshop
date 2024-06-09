import 'package:get/get.dart';
import '../../data/models/category_data.dart';
import '../../data/models/categorys_models.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utility/urls.dart';

class CategoryListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;
  List<CategoryData> cateGoryDataFromapi = [];

  Future<bool> getCategory() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final respons = await NetworkCaller.getRequest(url: Urls.categorysUrls);
    if (respons.isSuccess) {
      cateGoryDataFromapi =
          CategoryModels.fromJson(respons.responseData).categoryData ?? [];
      print(respons.responseData);
    } else {
      _errorMessage = respons.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
