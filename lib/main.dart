import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hacktu_care_frontend/auth/auth_cubit.dart';
import 'package:hacktu_care_frontend/auth/auth_state.dart';
import 'package:hacktu_care_frontend/auth/initial_page.dart';
import 'package:hacktu_care_frontend/auth/signin.dart';
import 'package:hacktu_care_frontend/auth/signup.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthInitalState) {
            return const InitialPage();
          }
          if (state is SigninState) {
            return const SigninPage();
          } else if (state is SignupState) {
            return SignupPage();
          } else if (state is AuthenticatedState) {
            return const AutoSizeText("Authenticated");
          } else {
            return Text("Last case");
          }
        },
      ),
    );
  }
}
