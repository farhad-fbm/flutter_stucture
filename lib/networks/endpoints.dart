// ignore_for_file: constant_identifier_names

const String url = "https://parvirk.softvencefsd.xyz";

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

final class Endpoints {
  Endpoints._();
  //backend_url
  static String signUp() => "/api/register";
  static String logIn() => "/api/login";
  static String logout() => "/api/logout";
  static String social() => "/api/social/media";
  static String forgetPassword() => "/api/password/forgot";
  static String resendOtp() => "/api/password/resend-otp";
  static String verifyOtp() => "/api/password/verify-otp";
  static String resetPassword() => "/api/password/reset";
  static String profile() => "/api/user/profile/get";
  static String updateProfile() => "/api/profile/update/user";
  static String changePassword() => "/api/password/update/user";

  static String getChat(String chatId) => "/api/chat/get/$chatId";

  static String example() => "/api/...";
}
