import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_app/configs/providers.dart';
import 'package:tcc_app/configs/routes.dart';
import 'package:tcc_app/configs/theme.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObeserve();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RFID',
      debugShowCheckedModeBanner: false,
      theme: reserveTheme(),
      initialRoute: '/',
      routes: routes(),
      builder: (context, child) {
        return Providers(child: child ?? const SizedBox());
      },
    );
  }
}

class MyBlocObeserve extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('ERRO:');
    debugPrint(error.toString());
    debugPrint('stack trace:');
    debugPrint(stackTrace.toString());
    super.onError(bloc, error, stackTrace);
  }
}
