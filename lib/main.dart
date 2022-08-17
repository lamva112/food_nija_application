import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_nija_application/app/change_notifies/cart_provider.dart';
import 'package:food_nija_application/app/change_notifies/change_notifies.dart';
import 'package:food_nija_application/app/change_notifies/foods_provider.dart';
import 'package:food_nija_application/app/change_notifies/user_provider.dart';
import 'package:food_nija_application/app/change_notifies/wishlist_provider.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/login/login_screen.dart';
import 'package:food_nija_application/app/features/onboarding/onboarding.dart';
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:food_nija_application/data/services/auth_service.dart';
import 'package:food_nija_application/firebase_options.dart';
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

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Brightness? _brightness;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _brightness = WidgetsBinding.instance.window.platformBrightness;
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    if (mounted) {
      setState(() {
        _brightness = WidgetsBinding.instance.window.platformBrightness;
      });
    }
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    _brightness == Brightness.light
        ? AppColors().changeColor(true)
        : AppColors().changeColor(false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageChangeProvider()),
        Provider<AuthService>(create: (_) => AuthService()),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FoodsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => WishlistProvider(),
        ),
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
          theme: _brightness == Brightness.dark
              ? AppColors().darkTheme
              : AppColors().lightTheme,
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            child: isViewed != 0 ? const OnBoarding() : const LoginScreen(),
          ),
          onGenerateRoute: RouteManager.generateRoute,
          locale: Provider.of<LanguageChangeProvider>(context, listen: true)
              .currentLocale,
        );
      },
    );
  }
}
