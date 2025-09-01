import 'package:blockyard_mobile/presentation/intro/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'helpers/widgets/generate_route.dart';
import 'utils/constants/color constants/colors.dart';

class BlockyardApp extends StatelessWidget {
  const BlockyardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
        },
        title: 'Block Yard Mobile',
        onGenerateRoute: generateRoute,
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
        ),
      ),
    );
  }
}
