import 'package:flutter/material.dart';
import 'package:food_nija_application/app/features/botttom_navigation%20bar/my_bottom_bar.dart';
import 'package:food_nija_application/app/features/login/login_screen.dart';
import 'package:food_nija_application/data/models/user.dart';
import 'package:food_nija_application/data/services/auth_service.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<Users?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<Users?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final Users? user = snapshot.data;
            return user == null
                ? const SafeArea(child: LoginScreen())
                : const MyBottomBar();
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
