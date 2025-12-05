import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/screens/cubit/exchange_rate_cubit.dart';
import 'package:flutter_project/screens/cubit/exchange_rate_state.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        title: Text('Курсы валют'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: MyScreenState(),
      ),
    );
  }
}

class MyScreenState extends StatelessWidget {
  String? _code;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExchangeRateCubit, ExchangeRateState>(
      builder: (context, state) {
        if (state is ExchangeRateLoadingState) {
          BlocProvider.of<ExchangeRateCubit>(context).loadExchangeRate(_code);
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ExchangeRateErrorState) {
          return const Center(child: Text("Произошла ошибка"));
        }

        if (state is ExchangeRateLoadedState) {
          final conversionRates = state.exchange_rate.conversionRates!;
          final String baseCode = state.exchange_rate.baseCode!;

          final Map<String, dynamic> jsonMap = conversionRates.toJson();

          final rateList = jsonMap.entries.map((entry) {
            return {
              "code": entry.key,
              "value": entry.value,
            };
          }).toList();

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Курсы валют к ${baseCode}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(child: _buildRatesList(rateList, baseCode)),
            ],
          );
        }

        return Container();
      },
    );
  }

  Widget _buildRatesList(List<Map<String, dynamic>> rates, String baseCode) {
    return ListView.builder(
      itemCount: rates.length,
      itemBuilder: (context, index) {
        final rate = rates[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
          child: ListTile(
            title: Text(
              rate["code"],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              "Курс к ${baseCode}: ${rate["value"]}",
              style: TextStyle(fontSize: 14),
            ),
            trailing: TextButton(
              onPressed: () {
                _code = rate["code"];
                BlocProvider.of<ExchangeRateCubit>(context).loadExchangeRate(_code);
              },
              child: Text("Выбрать", style: TextStyle(color: Colors.indigo)),
            ),
          ),
        );
      },
    );
  }
}
