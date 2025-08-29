import 'package:blockyard_mobile/presentation/authentication/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:toastification/toastification.dart';

import '../../../helpers/text_widgets.dart';
import '../../../helpers/widgets/custom_button.dart';
import '../../../helpers/widgets/dialogbox_util.dart';
import '../../../helpers/widgets/textform_widget.dart';
import '../../../utils/constants/color constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isRememberme = false;
  bool isLoginScreen = true;
  bool isSigninScreen = false;
  bool isChecked = false;
  bool isLoading = false;
  bool isToggeled = true;
  bool isVisible = true;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(_onFocusChange);
    _focusNode2.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (BuildContext context, state) {
        if (state is AuthLoading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() => isLoading = true);
          });
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() => isLoading = false);
          });
        }
        if (state is AuthFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            toastification.show(
              showProgressBar: false,
              description: Column(
                children: [
                  headingTextMedium(
                    context,
                    state.error,
                    FontWeight.w500,
                    12,
                    whiteColor,
                  ),
                ],
              ),
              autoCloseDuration: const Duration(seconds: 7),
              style: ToastificationStyle.fillColored,
              type: ToastificationType.error,
            );
          });
        } else if (state is AuthSucces) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/mainhome',
            (Route<dynamic> route) => false,
          );
          WidgetsBinding.instance.addPostFrameCallback((_) {
            toastification.show(
              showProgressBar: false,
              description: Column(
                children: [
                  headingTextMedium(
                    context,
                    state.message,
                    FontWeight.w500,
                    12,
                    whiteColor,
                  ),
                ],
              ),
              autoCloseDuration: const Duration(seconds: 7),
              style: ToastificationStyle.fillColored,
              type: ToastificationType.success,
            );
          });
        }
      },
      builder: (BuildContext context, state) {
        return Scaffold(
          backgroundColor: secondaryBg,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    headingText(context, 'Login your Account'),
                    SizedBox(height: 3),
                    subheadingText(context, 'continue shopping by logging in'),
                    SizedBox(height: 30),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          labelTextSmall(context, 'Email'),
                          SizedBox(height: 7),
                          emailtextFormField(
                            context,
                            _focusNode1,
                            emailController,
                          ),
                          SizedBox(height: 20),
                          labelTextSmall(context, 'Password'),
                          SizedBox(height: 7),
                          passwordTextFormField(
                            context,
                            _focusNode2,
                            passwordController,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    CustomButton(
                      text: 'Login Account',
                      onpressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      color: secondaryColor,
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: labelTextFaint(
                              context, 'Already registered? Login here'),
                        ),
                      ],
                    ),
                    SizedBox(height: 22),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
