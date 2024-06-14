import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../state_holders/order_status_controller.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({super.key});

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {

  @override
  void initState() {
    Get.find<OrderStausListController>().getOrderStausList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Status',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GetBuilder<OrderStausListController>(builder: (orderStatusList) {
        return RefreshIndicator(
          onRefresh: () async {
            orderStatusList.getOrderStausList();
          },
          child: Visibility(
            visible: orderStatusList.inProgress == false,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: orderStatusList.orderStatusDataFromapi.isEmpty
                ? Column(
              children: [
                Lottie.asset("assets/lottie/noproduct.json"),
                const Text("No Order Found")
              ],
            )
                : ListView.builder(
              itemCount: orderStatusList.orderStatusDataFromapi.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ExpansionTile(
                    leading: const Icon(Icons.reorder),
                    title: Text(
                      'Order Number: ${orderStatusList
                          .orderStatusDataFromapi[index].orderNumber }',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Status: ${orderStatusList.orderStatusDataFromapi[index]
                          .status}',
                      style: TextStyle(
                          color: orderStatusList.orderStatusDataFromapi[index]
                              .status == 'rejected'
                              ? Colors.red
                              : orderStatusList.orderStatusDataFromapi[index]
                              .status == 'pending' ? Colors.orange : Colors.green ),),
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          // Add padding for better spacing
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Date',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Text(
                                '${orderStatusList.orderStatusDataFromapi[index]
                                    .createdAt}',
                              ),
                              const SizedBox(height: 19),
                              const Text(
                                'Product',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Text(
                                  '${orderStatusList
                                      .orderStatusDataFromapi[index]
                                      .productName}'),
                              const SizedBox(height: 10),
                              const Text(
                                'Price',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Text(
                                  '৳${orderStatusList
                                      .orderStatusDataFromapi[index].price}'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
