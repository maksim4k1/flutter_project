import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/screens/cubit/main_screen_cubit.dart';
import 'package:flutter_project/screens/cubit/main_screen_state.dart';

class MainScreen extends StatelessWidget {
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
        child: MyFormScreen(),
      ),
    );
  }
}

class MyFormScreen extends StatefulWidget {
  @override
  _MyFormScreenState createState() => _MyFormScreenState();
}

class _MyFormScreenState extends State<MyFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _aField = TextEditingController();
  final _bField = TextEditingController();
  bool _agreement = false;

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Квадрат суммы',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text(
                'Введите число a:',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black38,
                ),
              )
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: _aField,
            validator: (value) {
              if(value!.isEmpty) return "Введите число a";
              if (double.tryParse(value) == null) return "Введите корректное число";
              return null;
            },
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text(
                'Введите число b:',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black38,
                ),
              )
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: _bField,
            validator: (value) {
              if(value!.isEmpty) return "Введите число b";
              if (double.tryParse(value) == null) return "Введите корректное число";
              return null;
            },
          ),
          CheckboxListTile(
            value: _agreement,
            title: Text("Я согласен на обработку данных"),
            onChanged: (value) {
              setState(() {
                _agreement = value!;
              });
            },
          ),
          ElevatedButton(onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (_agreement) {
                BlocProvider.of<MainScreenCubit>(context).calculateResult(
                    double.parse(_aField.text),
                    double.parse(_bField.text)
                );
              }
            }
          }, child: Text("Рассчитать")),
          BlocBuilder<MainScreenCubit, MainScreenState>(builder: (context, state) {
            if (state is MainScreenUpdateResultState) {
              return Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  "Сумма квадартов чисел a и b равна:\n${state.result}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              );
            }
            return Container();
          }),
        ],
      ),
    );
  }
}
