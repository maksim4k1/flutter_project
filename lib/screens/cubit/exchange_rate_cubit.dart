import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/models/exchange_rate.dart';
import 'package:flutter_project/screens/cubit/exchange_rate_state.dart';
import 'package:flutter_project/screens/requests/api.dart';

class ExchangeRateCubit extends Cubit<ExchangeRateState> {
  ExchangeRateCubit() : super(ExchangeRateLoadingState());

  double value = 0;
  List<String> results = [];

  Future<void> loadExchangeRate(String? baseCode) async {
    emit(ExchangeRateLoadingState());

    try {
      Map<String, dynamic> usd_api_data = await getExchangeRateData(baseCode ?? "USD");
      ExchangeRate exchange_rate = ExchangeRate.fromJson(usd_api_data);

      emit(ExchangeRateLoadedState(exchange_rate: exchange_rate));
    } catch(e) {
      emit(ExchangeRateErrorState());
      return;
    }
  }
}
