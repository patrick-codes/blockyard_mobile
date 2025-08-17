import 'package:flutter/material.dart';
import '../../presentation/home/home.dart';
import '../../presentation/home/main_home.dart';
import '../../presentation/products/pages/product_detail_page.dart';
import 'route_transition.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case '/welcome':
    //   return slideFromRight(const WelcomeScreen());

    case '/mainhome':
      return slideFromRight(MainHomePage());

    case '/home':
      return slideFromRight(MyHomePage());

    case '/details':
      final args = settings.arguments as Map<String, dynamic>;
      return slideFromRight(
        ProductDetailPage(
          id: args['id'],
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const MainHomePage(),
      );
  }
}
