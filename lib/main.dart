import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_nija_application/app/change_notifies/change_notifies.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/onboarding/onboarding.dart';
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:provider/provider.dart';
import 'app/core/utils/translations.dart';
import 'dart:io';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageChangeProvider()),
      ],
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: const [
            TranslationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('vi'),
          ],
          theme: AppColors().lightTheme,
          debugShowCheckedModeBanner: false,
          home: const SafeArea(
            child: OnBoarding(),
          ),
          onGenerateRoute: RouteManager.generateRoute,
          locale: Provider.of<LanguageChangeProvider>(context, listen: true).currentLocale,
        );
      },
    );
  }
}
