import 'package:flutter/material.dart';
import 'package:flutter_project/screens/cubit/result_screen_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/screens/result_screen.dart';

class ResultScreenProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResultScreenCubit>(
      create: (context) => ResultScreenCubit(),
      child: ResultScreen(),
    );
  }
}
