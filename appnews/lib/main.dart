import 'package:appnews/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            side: BorderSide(color: Colors.green, width: 2),
          ),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.green,
            fontSize: 20,
            fontFamily: 'NotoSansLao',
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.green),
        ),
      ),
      home: HomePage(),
    );
  }
}
