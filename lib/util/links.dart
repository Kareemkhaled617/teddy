import '../main.dart';

String baseLink = 'https://teddy-pearl.net/api/';
String baseLinkImage = 'https://e.msarweb.net/';
String loginLink = '${baseLink}teddy-login';
String signUpLink = '${baseLink}teddy-register';
String logOutLink = '${baseLink}teddy-logout';
String checkUserLink = '${baseLink}teddy-check';

Map<String, String> header = {
  'Authorization': sharedPreferences.getString('token') ?? ''
};
