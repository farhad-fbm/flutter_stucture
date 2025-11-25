import 'dart:io';

class GlobalState {
  static final GlobalState _instance = GlobalState._internal();
  factory GlobalState() => _instance;
  GlobalState._internal();

  String? userRole;
  void setRole(String role) {
    userRole = role;
  }

  String? getRole() {
    return userRole;
  }

  //-------------------------
  File? pickedImage;
  void setPickedImage(File image) {
    pickedImage = image;
  }

  File? getPickedImage() {
    return pickedImage;
  }
}
