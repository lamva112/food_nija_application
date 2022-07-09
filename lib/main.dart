import 'package:flutter/material.dart';
import 'package:food_nija_application/app/change_notifies/change_notifies.dart';
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => User()),
      ],
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: [
          ],
          debugShowCheckedModeBanner: false,
          initialRoute: RouteManager.homePage,
          onGenerateRoute: RouteManager.generateRoute,
        );
      },
    );
  }
}
