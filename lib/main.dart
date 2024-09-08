import 'package:flutter/material.dart';
import 'quote_page.dart';

void main() {
  runApp(RandomQuoteApp());
}

class RandomQuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Quote Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuotePage(),
    );
  }
}
