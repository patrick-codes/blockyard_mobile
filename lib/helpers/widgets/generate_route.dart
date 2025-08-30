import 'package:blockyard_mobile/presentation/authentication/pages/login.dart';
import 'package:blockyard_mobile/presentation/authentication/pages/register_screen.dart';
import 'package:flutter/material.dart';
import '../../presentation/home/home.dart';
import '../../presentation/home/main_home.dart';
import '../../presentation/intro/splash/splash_screen.dart';
import '../../presentation/products/pages/product_detail_page.dart';
import 'route_transition.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/register':
      return slideFromRight(const SignUpScreen());

    case '/login':
      return slideFromRight(const LoginScreen());

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
        builder: (_) => const SplashScreen(),
      );
  }
}
