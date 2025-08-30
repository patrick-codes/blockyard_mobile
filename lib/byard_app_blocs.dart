import 'package:blockyard_mobile/presentation/products/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'byard_app.dart';
import 'presentation/authentication/bloc/auth_bloc.dart';
import 'presentation/authentication/bloc/auth_events.dart';
import 'presentation/products/bloc/product detail bloc/product_detail_bloc.dart';

class BlockyardBlocs extends StatelessWidget {
  const BlockyardBlocs({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => AuthBloc()..add(AppStartedEvent()),
      ),
      BlocProvider(
        create: (context) => ProductBloc()..add(FetchProducts()),
      ),
      BlocProvider(
        create: (context) => ProductDetailBloc()..add(LoadProductDetail('')),
      ),
    ], child: BlockyardApp());
  }
}
