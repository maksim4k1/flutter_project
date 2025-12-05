import 'package:flutter_project/models/exchange_rate.dart';

abstract class ExchangeRateState{}

class ExchangeRateLoadingState extends ExchangeRateState {}

class ExchangeRateLoadedState extends ExchangeRateState {
  ExchangeRate exchange_rate;

  ExchangeRateLoadedState({required this.exchange_rate});
}

class ExchangeRateErrorState extends ExchangeRateState {}
