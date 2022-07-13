import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_nija_application/app/change_notifies/change_notifies.dart';
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:provider/provider.dart';
import 'app/core/values/languages/translations.dart';

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
            Locale("en"),
            Locale("vi"),
          ],
          debugShowCheckedModeBanner: false,
          initialRoute: RouteManager.homePage,
          onGenerateRoute: RouteManager.generateRoute,
          locale: Provider.of<LanguageChangeProvider>(context, listen: true).currentLocale,
        );
      },
    );
  }
}
