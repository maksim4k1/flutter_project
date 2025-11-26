abstract class ResultScreenState{}

class ResultScreenUpdateResultState extends ResultScreenState {
  final List<Map<String, double>> results;

  ResultScreenUpdateResultState({required this.results});
}
