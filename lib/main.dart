import 'package:blockyard_mobile/presentation/home/main_home.dart';
import 'package:flutter/material.dart';

import 'helpers/widgets/generate_route.dart';
import 'utils/constants/color constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BlockYard Ghana',
      initialRoute: '/',
      routes: {
        '/': (context) => const MainHomePage(),
      },
      onGenerateRoute: generateRoute,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: whiteColor),
        useMaterial3: true,
      ),
    );
  }
}
