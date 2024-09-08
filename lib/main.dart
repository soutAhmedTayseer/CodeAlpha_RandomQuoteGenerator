import 'package:flutter/material.dart';
import 'quote_page.dart';

void main() {
  runApp(const RandomQuoteApp());
}

class RandomQuoteApp extends StatelessWidget {
  const RandomQuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Quote Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuotePage(),
    );
  }
}
