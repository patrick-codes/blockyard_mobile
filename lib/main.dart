import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'byard_app_blocs.dart';
import 'byard_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //DioHelper.init();

  Bloc.observer = const BlockyardObserver();
  runApp(const BlockyardBlocs());
}
