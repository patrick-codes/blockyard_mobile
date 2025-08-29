import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'byard_app.dart';
import 'presentation/authentication/bloc/auth_bloc.dart';

class BlockyardBlocs extends StatelessWidget {
  const BlockyardBlocs({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => AuthBloc()..add(AppStartedEvent()),
      ),
    ], child: BlockyardApp());
  }
}
