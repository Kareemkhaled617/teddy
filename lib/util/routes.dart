import 'package:bubbletea/pages/cart/cart_screen.dart';
import 'package:bubbletea/pages/details/details_screen.dart';
import 'package:bubbletea/pages/home/home_screen.dart';
import 'package:bubbletea/pages/profile/profile_screen.dart';
import 'package:flutter/widgets.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
};
