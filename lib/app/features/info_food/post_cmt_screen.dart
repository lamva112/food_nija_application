import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_nija_application/app/change_notifies/user_provider.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:provider/provider.dart';

class PostCmtScreen extends StatefulWidget {
  final String foodId;
  PostCmtScreen({Key? key, required this.foodId}) : super(key: key);

  @override
  State<PostCmtScreen> createState() => _PostCmtScreenState();
}

class _PostCmtScreenState extends State<PostCmtScreen> {
  double _rating = 0.0;
  final TextEditingController _searchTextController = TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();
  bool isSearching = false;

  @override
  void dispose() {
    _searchTextController.dispose();
    _searchTextFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 25,
          ),
          color: AppColors.primaryColor,
        ),
        centerTitle: true,
        title: Text(
          'Reviews',
          style: TextStyle(color: AppColors.primaryColor, fontSize: 25),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.send,
              color: AppColors.primaryColor,
              size: 25,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: size.width,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromARGB(60, 166, 163, 163),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 18,
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage(userProvider.getUser.photoUrl),
                    radius: 18,
                  ),
                ),
                SizedBox(
                  width: 24,
                ),
                Container(
                  width: getWidth(290),
                  height: getHeight(36),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: _searchTextController,
                      focusNode: _searchTextFocusNode,
                      decoration: InputDecoration(
                        hintText: "Add a review...",
                        fillColor: Colors.transparent,
                        border: InputBorder.none,
                        suffix: TextButton(
                          onPressed: () {
                            _searchTextController.clear();
                            _searchTextFocusNode.unfocus();
                          },
                          child: Text(
                            "Post",
                            style: TextStyle(fontSize: 18, color: Colors.blue),
                          ),
                          autofocus: true,
                        ),
                      ),
                      onChanged: (valuee) {
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromARGB(60, 166, 163, 163),
            ),
            child: Center(
              child: RatingBar.builder(
                initialRating: 1.0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 8.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  _rating = rating;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
