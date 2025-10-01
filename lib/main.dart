import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          title: Text('Баженов Максим Валерьевич'),
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/my_image.jpg',
                  width: 300,
                  height: 300,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    'Баженов Максим\nВалерьевич',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    '18.06.2004',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black38,
                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'ТУСУР',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(
                    'гр. 422-2',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
