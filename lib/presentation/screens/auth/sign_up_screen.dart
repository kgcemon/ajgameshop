import 'package:ajgameshop/presentation/screens/main_bottam_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app.dart';
import '../../state_holders/sign_up_controller.dart';
import '../../utility/app_colors.dart';
import '../../widgets/banner_text.dart';
import '../../widgets/google_sign_in_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  SignUpController _signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              BannerText(
                  titel: 'Sign Up',
                  des: 'Welcome To our Free fire diamond top up app'),
              const SizedBox(height: 20),
              _signUpForm(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const GoogleSignInButton(),
    );
  }

  Widget _signUpForm() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _textFieldListCard(),
            const SizedBox(height: 16),
            _signUpButton(),
            const SizedBox(height: 20),
            _loginPrompt(),
          ],
        ),
      ),
    );
  }

  Widget _textFieldListCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(225, 95, 27, 0.3),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          _textField(
            controller: nameController,
            hintText: 'Name',
          ),
          _textField(hintText: 'Email', controller: emailController),
          _textField(hintText: 'Password', controller: passwordController),
          _textField(
              hintText: ' Confirm Password',
              controller: confirmPasswordController),
        ],
      ),
    );
  }

  Widget _textField({required String hintText, required controller}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: TextField(
        controller: controller,
        // controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () async {
        final result = await _signUpController.signUp(
            name: nameController.text,
            phoneNumber: emailController.text,
            password: passwordController.text,
            confirmPassword: confirmPasswordController.text);
        if (result == true) {
          Get.to(const MainBottomNavBarScreen());
        } else {
          ScaffoldMessenger.of(FFTopUp.navigationkey.currentState!.context)
              .showSnackBar(
                  SnackBar(content: Text(_signUpController.errorMessage)));
        }
      },
      child: GetBuilder<SignUpController>(builder: (_) {
        return Visibility(
          visible: _signUpController.inProgress == false,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.primaryColor,
            ),
            child: const Center(
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _loginPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Allready have an account?"),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Sign In',
              style: TextStyle(color: Colors.black, fontSize: 15)),
        ),
      ],
    );
  }
}
