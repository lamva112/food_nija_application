import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              primary: Colors.blue,
            ),
            onPressed: () {

            },
            child: const Text(
              'Go Home Screen',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
      ),
    );
  }
}
