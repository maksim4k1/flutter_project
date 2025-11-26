import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/screens/cubit/result_screen_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultScreenCubit extends Cubit<ResultScreenState> {
  ResultScreenCubit() : super(ResultScreenUpdateResultState(results: []));

  List<Map<String, double>> mapResults(List<String>? results) {
    if (results == null) return [];

    return results.map((result) {
      final elems = result.split(';');

      return {
        'result': double.parse(elems[0]),
        'a': double.parse(elems[1]),
        'b': double.parse(elems[2]),
      };
    }).toList();
  }

  Future<void> loadResults() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, double>> results = mapResults(prefs.getStringList('results'));

    print('Результаты: ${results}');

    emit(ResultScreenUpdateResultState(results: results));
  }
}
