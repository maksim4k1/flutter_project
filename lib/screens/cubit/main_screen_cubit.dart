import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/screens/cubit/main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenUpdateResultState(result: 0));

  double value = 0;

  void calculateResult(double a, double b){
    value = (a + b) * (a + b);
    emit(MainScreenUpdateResultState(result: value));
  }
}
