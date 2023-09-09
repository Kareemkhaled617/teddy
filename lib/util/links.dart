import '../main.dart';

String baseLink = 'https://teddy-pearl.net/api/';
String baseLinkImage = 'https://e.msarweb.net/';
String loginLink = '${baseLink}teddy-login';
String signUpLink = '${baseLink}teddy-register';
String logOutLink = '${baseLink}teddy-logout';
String checkUserLink = '${baseLink}teddy-check';
String categoryLink = '${baseLink}teddy-all-category';
String categoryJuicesLink = '${baseLink}teddy-category-juices';
String juicesDetailsLink = '${baseLink}teddy-juice';
String userOrdersLink = '${baseLink}teddy-user-orders';
String userOrdersDetailsLink = '${baseLink}teddy-order-details';
String addToCartLink = '${baseLink}teddy-cart';
String userCartLink = '${baseLink}teddy-user-cart';
String deleteItemFromCartLink = '${baseLink}teddy-delete-item';
String checkOutLink = '${baseLink}teddy-checkout';

Map<String, String> header = {
  'Authorization': sharedPreferences.getString('token') ?? ''
};
