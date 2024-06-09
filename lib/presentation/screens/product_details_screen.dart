import 'package:ajgameshop/presentation/screens/order_success_screen.dart';
import 'package:ajgameshop/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/product_models.dart';
import '../state_holders/order_controller.dart';
import '../widgets/appbar.dart';
import '../widgets/item_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen(
      {super.key,
      required this.products,
      required this.productImg,
      required this.productTitle});

  List<Products> products;
  String productImg;
  String productTitle;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final OrderController _orderController = Get.find<OrderController>();

  Products? selectedPrich;

  // int selectedIndex = 0;
  Products? _productsvalue;

  final TextEditingController _playerTEcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.products.isEmpty) {
      return;
    }

    selectedPrich = widget.products[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.productImg),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.productTitle,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ItemPicker(
                products: widget.products,
                onChange: (values) {
                  _productsvalue = values;
                  // selectedIndex = ;
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Player Id',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Card(
                color: Colors.transparent,
                shadowColor: AppColors.primaryColor,
                elevation: 10,
                child: TextFormField(
                  controller: _playerTEcontroller,
                  decoration: const InputDecoration(
                    label: Text("Player ID"),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GetBuilder<OrderController>(builder: (_) {
        return Visibility(
          visible: _orderController.inProgress == false,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: InkWell(
            onTap: () {
              _orderController
                  .orderApiCall(
                      productID: _productsvalue?.sId ?? '',
                      playerId: _playerTEcontroller.text)
                  .then(
                (value) {
                  if (value == true) {
                    Get.offAll(
                      () => OrderSuccessScreen(
                        oderNumber: _orderController.orderResult['data']
                                ['orderNumber']
                            .toString(),
                      ),
                    );
                  }else{
                    Get.snackbar(
                      colorText: Colors.white,
                      backgroundColor: AppColors.primaryColor,
                        "Error", 'Insufficient balance',);
                  }
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(30)),
              child: const Text(
                'Order Now',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
