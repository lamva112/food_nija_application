import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/home_screen.dart';
import 'package:food_nija_application/app/features/onboarding/widget/build_page.dart';
import 'package:food_nija_application/app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final pageController = PageController();
  var _selectedIndex = 0;

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> page = [
      {
        'image': 'assets/images/onboarding1.png',
        'title': Translations.of(context).text('titleOB1'),
        'description': Translations.of(context).text('desOB1'),
      },
      {
        'image': 'assets/images/onboarding2.png',
        'title': Translations.of(context).text('titleOB2'),
        'description': Translations.of(context).text('desOB2'),
      },
    ];
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState((){
                    _selectedIndex = value;
                  });
                },
                itemCount: page.length,
                itemBuilder: (BuildContext context, int index) {
                  return TweenAnimationBuilder(
                    tween: Tween(begin: 1.0, end: 1.0),
                    duration: const Duration(milliseconds: 350),
                    builder:
                        (BuildContext context, double value, Widget? child) {
                      return Transform.scale(
                        scale: value,
                        child: child,
                      );
                    },
                    child: BuildPage(
                      image: page[index]['image']!,
                      title: page[index]['title']!,
                      description: page[index]['description']!,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate( page.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                            width: _selectedIndex == index ? 20 : 8,
                            height: 8.0,
                            decoration: BoxDecoration(
                              color: _selectedIndex == index ? Colors.redAccent : Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topCenter,
                child: MaterialButton(
                  onPressed: () {
                    _storeOnboardInfo();
                    Navigator.pushReplacementNamed(context, RouteManager.homePage);
                  },
                  height: 60,
                  minWidth: 160,
                  color: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    Translations.of(context).text('skip'),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: AppColors.textButtonColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
