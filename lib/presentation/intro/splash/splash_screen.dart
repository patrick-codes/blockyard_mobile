import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/constants/color constants/colors.dart';
import '../../authentication/bloc/auth_bloc.dart';
import '../../authentication/bloc/auth_states.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late AnimationController _controller2;
  late Animation<Offset> _slideAnimation2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _slideAnimation2 =
        Tween<Offset>(begin: const Offset(2, 0), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
    _controller2.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, state) async {
        if (state is AuthAuthenticated) {
          await Future.delayed(const Duration(seconds: 2));
          Navigator.pushNamedAndRemoveUntil(
              context, '/mainhome', (route) => false);
        } else {
          await Future.delayed(const Duration(seconds: 2));
          Navigator.pushNamedAndRemoveUntil(
              context, '/register', (route) => false);
        }
      },
      child: Scaffold(
        backgroundColor: secondaryBg,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SlideTransition(
                        position: _slideAnimation,
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 130,
                          width: 130,
                        ),
                      ),
                      SizedBox(height: 15),
                      // SlideTransition(
                      //   position: _slideAnimation2,
                      //   child: Text(
                      //     "Block Yard Ghana",
                      //     style: Theme.of(context)
                      //         .textTheme
                      //         .displaySmall!
                      //         .copyWith(
                      //           color: primaryColor,
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
