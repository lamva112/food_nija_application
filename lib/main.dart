import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_nija_application/app/change_notifies/change_notifies.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/onboarding/onboarding.dart';
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:food_nija_application/data/services/auth_service.dart';
import 'package:food_nija_application/firebase_options.dart';
import 'package:food_nija_application/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/core/utils/translations.dart';

int? isViewed;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
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
        Provider<AuthService>(create: (_) => AuthService()),
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
            child: isViewed != 0
                ? const OnBoarding()
                : const Wrapper(),
          ),
          onGenerateRoute: RouteManager.generateRoute,
          locale: Provider.of<LanguageChangeProvider>(context, listen: true)
              .currentLocale,
        );
      },
    );
  }
}
