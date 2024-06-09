import 'package:ajgameshop/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../state_holders/profile_controller.dart';
import '../state_holders/waller_history_controller.dart';
import 'add_money_screen.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Get.find<ProfileController>().getUser();
          await Get.find<WalletHistoryListController>().getWalletHistroList();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: AppColors.primaryColor.withOpacity(0.6),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      // color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Available Balance',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${Get.find<ProfileController>().userDataFromApi?.wallet ?? 0}৳',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(const AddMoneyScreen());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                          ),
                          child: const Text(
                            'Add Money',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              const Center(
                child: Text(
                  'Wallet History',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Expanded(
                child: GetBuilder<WalletHistoryListController>(
                    builder: (walletHiistoryData) {
                  return walletHiistoryData.wallerHistroyDataFromapi.isEmpty
                      ? Lottie.asset("assets/lottie/noproduct.json")
                      : ListView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          itemCount: walletHiistoryData
                                  .wallerHistroyDataFromapi.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.white,
                                shadowColor: Colors.white,
                                surfaceTintColor: AppColors.primaryColor,
                                child: ExpansionTile(
                                  backgroundColor: Colors.white,
                              leading: const Icon(Icons.monetization_on),
                              title: Text(
                                  '${walletHiistoryData.wallerHistroyDataFromapi[index].amount} ৳'),
                              subtitle: Text(
                                  '${walletHiistoryData.wallerHistroyDataFromapi[index].status}'),
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Order No',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          '${walletHiistoryData.wallerHistroyDataFromapi[index].sId}',
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'Acc No',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          '${walletHiistoryData.wallerHistroyDataFromapi[index].phone}',
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'Transaction id',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          '${walletHiistoryData.wallerHistroyDataFromapi[index].trxId}',
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ));
                          },
                        );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
