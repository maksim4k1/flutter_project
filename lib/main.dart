import 'package:flutter/material.dart';

// 2.Реализовать калькулятор квадратов суммы.
// На первом экране должны располагаться 2 числовых поля ввода (число a и число b),
// а также чек-бокс на согласие обработки данных. Реализовать валидацию полей и чек-бокса.
// Передать данные с первого экрана на второй экран произвести расчеты и отобразить.

void main() {
  runApp(
    MaterialApp(
      home: FirstScreen(),
    ),
  );
}

class FirstScreen extends StatelessWidget {
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
              padding: EdgeInsets.only(top: 40),
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
              print(_aField.text);
              print(_bField.text);
            }

            if (_agreement) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(
                aValue: double.parse(_aField.text),
                bValue: double.parse(_bField.text),
              )));
            }
          }, child: Text("Рассчитать"))
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  double aValue;
  double bValue;

  SecondScreen({required this.aValue, required this.bValue});

  @override
  Widget build(BuildContext context) {
    double result = (aValue + bValue) * (aValue + bValue);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        title: Text('Баженов Максим Валерьевич'),
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 40, left: 10),
          child: Text(
            "Сумма квадартов чисел a и b равна:\n$result",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
      ),
    );
  }
}
