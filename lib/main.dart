import 'package:flutter/material.dart';
import 'package:flutter_project/screens/main_screens_provider.dart';

// 2.Реализовать калькулятор квадратов суммы.
// На первом экране должны располагаться 2 числовых поля ввода (число a и число b),
// а также чек-бокс на согласие обработки данных. Реализовать валидацию полей и чек-бокса.
// Передать данные с первого экрана на второй экран произвести расчеты и отобразить.

void main() {
  runApp(
    MaterialApp(
      home: MainScreenProvider(),
    ),
  );
}
