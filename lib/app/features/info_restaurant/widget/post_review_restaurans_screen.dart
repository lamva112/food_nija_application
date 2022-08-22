import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_nija_application/app/change_notifies/user_provider.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/loading_screen.dart';
import 'package:food_nija_application/data/services/common_methods.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class PostReviewRestaurantScreen extends StatefulWidget {
  final String resId;
  PostReviewRestaurantScreen({Key? key, required this.resId}) : super(key: key);

  @override
  State<PostReviewRestaurantScreen> createState() =>
      _PostReviewRestaurantScreenState();
}

class _PostReviewRestaurantScreenState
    extends State<PostReviewRestaurantScreen> {
  double _rating = 0.0;
  final TextEditingController _searchTextController = TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();
  String rv = '';
  DateTime date = DateTime.now();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;

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
            onPressed: () {
              _updateReview(
                foodId: widget.resId,
                profilePic: userProvider.getUser.photoUrl,
                review: rv,
                rating: _rating,
                name: userProvider.getUser.username,
              );
            },
          ),
        ],
      ),
      body: LoadingManager(
        isLoading: _isLoading,
        child: Column(
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
                          suffix: IconButton(
                            onPressed: () {
                              _searchTextController.clear();
                              _searchTextFocusNode.unfocus();
                            },
                            icon: Icon(
                              Icons.close,
                              color: _searchTextFocusNode.hasFocus
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                        onFieldSubmitted: (String _) {
                          setState(() {
                            rv = _searchTextController.text;
                          });
                          print(_);
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
      ),
    );
  }

  void _updateReview({
    required String foodId,
    required String profilePic,
    required String review,
    required String name,
    required double rating,
  }) async {
    FocusScope.of(context).unfocus();

    if (rv != "") {
      setState(() {
        _isLoading = true;
      });
      try {
        String reviewId = const Uuid().v1();
        _firestore
            .collection('restaurants')
            .doc(foodId)
            .collection('reviews')
            .doc(reviewId)
            .set({
          'profilePic': profilePic,
          'name': name,
          'rating': rating,
          'review': rv,
          'datePublished': Timestamp.now(),
          'dateRV': DateFormat('yMMMMd').format(date),
        });

        await Fluttertoast.showToast(
          msg: "our reviews has been posted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
        Navigator.pop(context);
      } catch (error) {
        GlobalMethods.errorDialog(subtitle: '$error', context: context);
        setState(() {
          _isLoading = false;
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
