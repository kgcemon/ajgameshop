import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.all(30),
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.black, width: 1),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://cdn4.iconfinder.com/data/icons/logos-brands-7/512/google_logo-google_icongoogle-512.png',
            width: 30,
          ),
          const SizedBox(width: 10),
          const Text(
            'Continue with Google',
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ],
      ),
    ) ;
  }
}
