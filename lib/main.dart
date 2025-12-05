import 'package:flutter/material.dart';
import 'package:flutter_project/screens/cubit/exchange_rate_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/screens/main_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ExchangeRateCubit(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
