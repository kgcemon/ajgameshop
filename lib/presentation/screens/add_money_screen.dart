import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uddoktapay/models/credentials.dart';
import 'package:uddoktapay/models/customer_model.dart';
import 'package:uddoktapay/models/request_response.dart';
import 'package:uddoktapay/uddoktapay.dart';
import 'package:uddoktapay/widget/custom_snackbar.dart';

class AddMoneyScreen extends StatefulWidget {
  const AddMoneyScreen({super.key});

  @override
  State<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _amountTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Money'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Lottie.asset("assets/lottie/wallet.json"),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _amountTEController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(label: Text("Enter Your Amount")),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50)),
                  onPressed: () async {
                    if (true) {
                      final response = await UddoktaPay.createPayment(
                        context: context,
                        customer: CustomerDetails(
                          fullName: 'emon',
                          email: 'kgcemonbd@gmail.com',
                        ),
                        amount: _amountTEController.text,
                      );
                      if (response.status == ResponseStatus.completed) {
                        // handle on complete
                        snackBar('Success. ${response.status}', context);
                      }

                      if (response.status == ResponseStatus.canceled) {
                        // handle on cancel
                      }

                      if (response.status == ResponseStatus.pending) {
                        // handle on pending
                      }
                    }
                  },
                  child: const Text(
                    'Pay Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
