import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_nija_application/app/change_notifies/change_notifies.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/home_screen.dart';
import 'package:food_nija_application/app/features/login/login_screen.dart';
import 'package:food_nija_application/app/features/onboarding/onboarding.dart';
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/core/utils/translations.dart';

int? isviewed;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          home: SafeArea(
            child: isviewed != 0 ? const OnBoarding() : const LoginScreen(),
          ),
          onGenerateRoute: RouteManager.generateRoute,
          locale: Provider.of<LanguageChangeProvider>(context, listen: true)
              .currentLocale,
        );
      },
    );
  }
}
