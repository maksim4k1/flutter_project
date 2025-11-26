import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/screens/cubit/result_screen_cubit.dart';
import 'package:flutter_project/screens/cubit/result_screen_state.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        title: Text('Баженов Максим Валерьевич'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ResultListScreen(),
      ),
    );
  }
}

class ResultListScreen extends StatefulWidget {
  @override
  _ResultListScreenState createState() => _ResultListScreenState();
}

class _ResultListScreenState extends State<ResultListScreen> {
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: Text(
              'История результатов',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            )
        ),
        BlocBuilder<ResultScreenCubit, ResultScreenState>(builder: (context, state) {
          BlocProvider.of<ResultScreenCubit>(context).loadResults();

          if (state is ResultScreenUpdateResultState) {
            return Column(
              children: state.results.map((result) {
                print(result);
                
                return Text(
                  "a: ${result["a"]}; b: ${result["b"]}; res: ${result["result"]}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }).toList(),
            );
          }
          return Container();
        }),
      ],
    );
  }
}
