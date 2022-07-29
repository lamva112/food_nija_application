import 'package:flutter/material.dart';
import 'package:food_nija_application/app/features/home_screen.dart';
import 'package:food_nija_application/app/features/login/login_screen.dart';
import 'package:food_nija_application/data/models/user.dart';
import 'package:food_nija_application/data/services/auth_service.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authServiec = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
        stream: authServiec.user,
        builder: (_, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            return user == null ? const SafeArea(child: LoginScreen()) : const HomeScreen();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
