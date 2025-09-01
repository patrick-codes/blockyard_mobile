import 'package:blockyard_mobile/helpers/widgets/custom_button.dart';
import 'package:blockyard_mobile/utils/constants/color%20constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../helpers/widgets/custom_appbar.dart';
import '../authentication/bloc/auth_bloc.dart';
import '../authentication/bloc/auth_events.dart';
import '../authentication/bloc/auth_states.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBg,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Profile',
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ProfileLoggedOut) {
            // Navigate back to login page after logout
            Navigator.pushReplacementNamed(context, "/login");
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AuthAuthenticated) {
            final user = state.user; // adjust to your user model

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: secondaryColor,
                    radius: 50,
                    child: Icon(
                      MingCute.user_1_line,
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user?.name ?? "No Name",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    user?.email ?? "No Email",
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                  const Spacer(),
                  CustomButton(
                    text: 'Logout',
                    onpressed: () {
                      context.read<AuthBloc>().add(LogoutProfile());
                    },
                    color: Colors.red,
                  )
                ],
              ),
            );
          } else if (state is ProfileLoggedOut) {
            return const Center(child: Text("Logged out"));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
