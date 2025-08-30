import 'package:blockyard_mobile/presentation/authentication/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../helpers/text_widgets.dart';
import '../../../helpers/widgets/custom_button.dart';
import '../../../helpers/widgets/textform_widget.dart';
import '../../../utils/constants/color constants/colors.dart';
import '../bloc/auth_events.dart';
import '../bloc/auth_states.dart';

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
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Welcome back, ${state.user!.name}!")),
          );
          Navigator.pushReplacementNamed(context, "/mainhome");
        } else if (state is AuthError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(8.0),
                      bottom: Radius.circular(8),
                    ),
                  ),
                  title: Center(
                    child: headingTextMedium(
                      context,
                      'Authentication Error!',
                      FontWeight.w600,
                      16,
                      Colors.red,
                    ),
                  ),
                  content: headingTextMedium(
                    context,
                    state.message,
                    FontWeight.w500,
                    12,
                  ),
                );
              },
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
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          context.read<AuthBloc>().add(
                                LoginUserEvent(
                                  emailController.text,
                                  passwordController.text,
                                ),
                              );
                        }
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: secondaryColor.withOpacity(0.25),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              state is AuthLoading
                                  ? SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: whiteColor,
                                      ),
                                    )
                                  : SizedBox.shrink(),
                              SizedBox(width: 8),
                              Text(
                                'Login Account',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: labelTextFaint(
                              context, 'Dont have an account? Register here'),
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
