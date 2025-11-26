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
}
