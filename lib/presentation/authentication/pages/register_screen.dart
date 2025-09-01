import 'package:blockyard_mobile/presentation/authentication/bloc/auth_bloc.dart';
import 'package:blockyard_mobile/presentation/authentication/bloc/auth_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../helpers/text_widgets.dart';
import '../../../helpers/widgets/textform_widget.dart';
import '../../../utils/constants/color constants/colors.dart';
import '../bloc/auth_states.dart';

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
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Welcome ${state.user!.name}!")),
          );

          Navigator.pushReplacementNamed(context, "/mainhome");
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                duration: Duration(seconds: 3),
                content: Text("${state.message}!")),
          );
          // WidgetsBinding.instance.addPostFrameCallback((_) {
          //   showDialog(
          //     context: context,
          //     builder: (BuildContext context) {
          //       return AlertDialog(
          //         backgroundColor: Colors.white,
          //         shape: const RoundedRectangleBorder(
          //           borderRadius: BorderRadius.vertical(
          //             top: Radius.circular(8.0),
          //             bottom: Radius.circular(8),
          //           ),
          //         ),
          //         title: Center(
          //           child: headingTextMedium(
          //             context,
          //             'Authentication Error!',
          //             FontWeight.w600,
          //             16,
          //             Colors.red,
          //           ),
          //         ),
          //         content: headingTextMedium(
          //           context,
          //           state.message,
          //           FontWeight.w500,
          //           12,
          //         ),
          //       );
          //     },
          //   );
          // });
        }
      },
      builder: (context, state) {
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
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          context.read<AuthBloc>().add(
                                RegisterUserEvent(
                                  nameController.text,
                                  phoneController.text,
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
                                'Create Account',
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
