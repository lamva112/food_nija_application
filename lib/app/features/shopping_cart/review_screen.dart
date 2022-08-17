import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_nija_application/app/common_widgets/custom_button.dart';
import 'package:food_nija_application/app/common_widgets/text_form_field.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final note = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: getHeight(325),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_app.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getHeight(40), horizontal: getWidth(20)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: getWidth(200),
                      height: getWidth(200),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 10.0,
                            color: AppColors.primaryColor,
                          )),
                      child: Center(
                        child: FractionallySizedBox(
                          heightFactor: 0.95,
                          widthFactor: 0.95,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/logo_app.png'),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: getHeight(40)),
                    Text(
                      Translations.of(context).text('Thank you'),
                      style: TextStyle(
                        fontSize: getFont(30),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: getHeight(30)),
                    Text(
                      Translations.of(context).text('Rate'),
                      style: TextStyle(
                        fontSize: getFont(20),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Card(
                      elevation: 2,
                      color: AppColors.backgroundLoginColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      margin: EdgeInsets.only(top: getHeight(40)),
                      child: SizedBox(
                        height: getHeight(250),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: getHeight(10)),
                              child: ListTile(
                                leading: Image.asset(
                                  'assets/images/image_popular_1.png',
                                  width: getWidth(65),
                                  height: getWidth(65),
                                ),
                                title: Text(
                                  'Lê Hải Phong',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: getFont(16),
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  'test',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: getFont(15),
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                trailing: Text(
                                  'x3',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: getFont(15),
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: getWidth(20), right: getWidth(15)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Translations.of(context).text('Total'),
                                    style: TextStyle(
                                        color: AppColors.textColor,
                                        fontSize: getFont(17),
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline),
                                  ),
                                  Text(
                                    '150 \$',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: getFont(18),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: getWidth(300),
                              child: const Divider(
                                thickness: 2,
                              ),
                            ),
                            RatingBar.builder(
                              itemBuilder: (BuildContext context, int index) =>
                                  Icon(
                                Icons.star,
                                color: AppColors.priceTextColor,
                              ),
                              onRatingUpdate: (double value) {},
                              initialRating: 0,
                              minRating: 0,
                              allowHalfRating: true,
                              maxRating: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: getWidth(8)),
                            ),
                            SizedBox(height: getHeight(10)),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getWidth(20)),
                              child: TextInputWidget(
                                textEditingController: note,
                                hintText:
                                    Translations.of(context).text('Feedback'),
                                prefixIcon: const Icon(Icons.edit_note),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: getHeight(40)),
                    CustomButton(
                      title: Translations.of(context).text('Submit'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      height: getHeight(55),
                      width: getWidth(350),
                      backgroundColor: AppColors.primaryColor,
                      fontSize: getFont(22),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
