// ignore_for_file: constant_identifier_names

const String url = "https://miskstoreg.softvencefsd.xyz";

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
  // static String signUp() => "/api/register";
  // static String logIn() => "/api/login";
  // static String getShopByCategories(String slug) =>
  //     "/api/shop-categories/$slug/";

  static String logIn() => "/api/users/login";
  static String signUp() => "/api/users/register";
  static String forgetPassword() => "/api/users/login/email-verify";
  static String otpVerify() => "/api/users/login/otp-verify";
  static String resetPassword() => "/api/users/login/reset-password";
  static String resumeTemplate() => "/api/resume-templates";
  static String faq() => "/api/faq/all";
  static String interviewAi() => "/api/ai-interviewer";
  static String interviewPreparation() =>
      "/api/interview-preparation-assistant";
  static String chatAi() => "/api/chat-history";
  static String recentActivity() => "/api/all-recent-activities";
  static String pofileUpdate() => "/api/users/data/update";
  static String logout() => "/api/users/logout";
  static String changePassword() => "/api/users/password/change";
  static String profileInfo() => "/api/users/data";
  static String documents() => "/api/all-documents";
  static String coverLetter() => "/api/generate-cover-letter";
  static String saveDraft() => "/api/interview-question-draft";
  static String draft() => "/api/all-drafts";
  static String jobMatcher() => "/api/job-matching";
  static String linkdinOptimization() => "/api/linkedin-profile-optimizer";
  static String subscription() => "/api/subscription-plans";
  static String deleteAccount() => "/api/users/delete";
  static String pushNotification() => "/api/update-notification";
  static String interviewNotification() => "/api/update-interview-preparation";
  static String expringSubscription() => "/api/update-expiring-subscription";
  static String applicationDeadline() => "/api/update-application-deadline";
  static String emailNotification() => "/api/update-email-notification";
  static String notification() => "/api/all-notifications";
  static String createResume(int resumeId) => "/api/generate/$resumeId/pdf/app";
  static String viewDocument(id) => "/api/export-document/$id";
  static String deleteDraft(id) => "/api/delete-draft/$id";
  static String applayChange(id) => "/api/apply-changes-app/$id";
  static String payment(subscriptionPlanId) => "/api/subscription-plan/$subscriptionPlanId/payment";
}
