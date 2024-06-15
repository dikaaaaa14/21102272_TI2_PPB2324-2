import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_firebase_auth/bloc/login/login_cubit.dart';
import 'package:my_firebase_auth/ui/splash.dart';
import 'package:my_firebase_auth/utils/routes.dart';
import 'firebase_options.dart';
import 'package:my_firebase_auth/bloc/register/register_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit())
      ],
      child: MaterialApp(
        title: "Praktikum 8",
        debugShowCheckedModeBanner: false,
        navigatorKey: navKey, // Change to navKey
        onGenerateRoute: generateDynamicRoute, // Change to generateDynamicRoute
        home: const SplashScreen(),
      ),
    );
  }
}