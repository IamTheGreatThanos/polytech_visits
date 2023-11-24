import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polytech_visits/pages/auth/auth_page.dart';
import 'package:polytech_visits/pages/auth/bloc/auth_bloc.dart';
import 'package:polytech_visits/pages/home/bloc/home_bloc.dart';
import 'package:polytech_visits/pages/home/home_page.dart';
import 'package:polytech_visits/widgets/custom_snackbar.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polytech Visits',
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
              create: (context) => AuthBloc()..add(EventAuthInitial())),
          BlocProvider<HomeBloc>(
              create: (context) => HomeBloc()..add(HomeInitialEvent())),
        ],
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is StateAuthRejected) {
              showCustomSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is StateAuthConfirmed) {
              return const HomePage();
            } else {
              return const AuthPage();
            }
          },
        ),
      ),
    );
  }
}
