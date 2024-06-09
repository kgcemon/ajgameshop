import 'package:ajgameshop/presentation/screens/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app.dart';
import '../../state_holders/sign_in_controller.dart';
import '../../utility/app_colors.dart';
import '../../widgets/banner_text.dart';
import '../../widgets/google_sign_in_button.dart';
import '../main_bottam_nav_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SignInController _signInController = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              BannerText(titel: 'Login', des: 'Welcome Back'),
              const SizedBox(height: 20),
              _loginForm(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const GoogleSignInButton(),
    );
  }

  Widget _loginForm() {
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
            TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            _loginButton(),
            const SizedBox(height: 20),
            _signUpPrompt(),
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
              hintText: 'Email', controller: _emailController),
          _textField(hintText: 'Password', controller: _passwordController),
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

  Widget _loginButton() {
    return InkWell(
      onTap: () async {
        final result = await _signInController.signIn(
            phoneNumber: _emailController.text,
            password: _passwordController.text);
        if (result == true) {
          Get.to(MainBottomNavBarScreen());
        } else {
          ScaffoldMessenger.of(FFTopUp.navigationkey.currentState!.context)
              .showSnackBar(
                  SnackBar(content: Text(_signInController.errorMessage)));
        }
      },
      child: GetBuilder<SignInController>(
        builder: (_) {
          return Visibility(
            visible: _signInController.inProgress == false,
            replacement:  Center(child: CircularProgressIndicator(),),
            child: Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.primaryColor,
              ),
              child: const Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  Widget _signUpPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?"),
        TextButton(
          onPressed: () => Get.to(
            SignUpScreen(),
          ),
          child: const Text(
            'Sign up',
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
