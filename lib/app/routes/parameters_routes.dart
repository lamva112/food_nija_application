import 'package:food_nija_application/data/models/user.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhotoScreen {
  final User user;
  final XFile? image;
  UploadPhotoScreen({required this.user, required this.image});
}