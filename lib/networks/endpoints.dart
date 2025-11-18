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
  static String support() => "/api/contact-form";
  static String questionaries() => "/api/all/questions";
  static String questionAnswer() => "/api/questions/answer";
  static String articles() => "/api/article/list";
  static String products() => "/api/product/list/retrieve";
  static String addToCart() => "/api/add/to/cart";
  static String cartList() => "/api/cart/list";
  static String plusCart() => "/api/cart/qty/plus";
  static String minusCart() => "/api/cart/qty/minus";
  static String removeCart() => "/api/remove/cart/item";
  static String checkout() => "/api/checkout";
  static String orderList() => "/api/order/list";
  static String chatList() => "/api/chat/list";
  static String sendMessage() => "/api/chat/send";
  static String getChat(String conversationId) =>
      "/api/chat/get/$conversationId";
  // static String getShopByCategories(String slug) =>
  //     "/api/shop-categories/$slug/";

  static String example() => "/api/";
}
