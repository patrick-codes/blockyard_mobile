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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isRememberme = false;
  bool isSignupScreen = true;
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
    _focusNode3.addListener(_onFocusChange);
    _focusNode4.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
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
                    headingText(context, 'Create Account'),
                    SizedBox(height: 3),
                    subheadingText(
                        context, 'start shopping by creating an account'),
                    SizedBox(height: 30),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          labelTextSmall(context, 'Username'),
                          SizedBox(height: 7),
                          textFormField(
                            context,
                            'Create Username',
                            MingCute.user_3_line,
                            TextInputType.text,
                            _focusNode1,
                            nameController,
                          ),
                          SizedBox(height: 20),
                          labelTextSmall(context, 'Phone'),
                          SizedBox(height: 7),
                          textFormField(
                            context,
                            'Enter Phone Number',
                            MingCute.user_3_line,
                            TextInputType.text,
                            _focusNode2,
                            phoneController,
                          ),
                          SizedBox(height: 20),
                          labelTextSmall(context, 'Email'),
                          SizedBox(height: 7),
                          emailtextFormField(
                            context,
                            _focusNode3,
                            emailController,
                          ),
                          SizedBox(height: 20),
                          labelTextSmall(context, 'Password'),
                          SizedBox(height: 7),
                          passwordTextFormField(
                            context,
                            _focusNode4,
                            passwordController,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    CustomButton(
                      isLoading: isLoading,
                      text: 'Create Account',
                      onpressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                SignupEvent(
                                  name: nameController.text.trim(),
                                  phone: phoneController.text.trim(),
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                              );
                        }
                      },
                      color: secondaryColor,
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
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
