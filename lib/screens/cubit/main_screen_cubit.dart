import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/screens/cubit/main_screen_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenUpdateResultState(result: 0));

  double value = 0;
  List<String> results = [];

  Future<void> calculateResult(double a, double b) async {
    value = (a + b) * (a + b);
    results.add("${value};${a};${b}");

    final prefs = await SharedPreferences.getInstance();

    final List<String>? gotResults = prefs.getStringList('results');
    final List<String> allResults = [...gotResults ?? [], ...results];

    await prefs.setStringList('results', allResults);

    results.clear();

    emit(MainScreenUpdateResultState(result: value));
  }
}
