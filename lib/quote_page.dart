import 'package:flutter/material.dart';
import 'package:flutter_projects/quote.dart';
import 'package:flutter_projects/quote_display.dart';
import 'package:share_plus/share_plus.dart';

import 'api_service.dart';
import 'buttons_row.dart';


class QuotePage extends StatefulWidget {
  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  Quote? _quote;

  // Function to fetch a random quote
  Future<void> _getRandomQuote() async {
    final newQuote = await ApiService.fetchRandomQuote();
    setState(() {
      _quote = newQuote;
    });
  }

  // Function to share the quote
  void _shareQuote() {
    if (_quote != null) {
      // Format the quote and author for sharing
      final String quoteText = '"${_quote!.content}"\n- ${_quote!.author}';

      // Use the Share package to trigger the native share dialog
      Share.share(quoteText, subject: 'Inspiring Quote');
    } else {
      // Show a SnackBar if no quote is available to share
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No quote available to share!')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Quote Generator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: QuoteDisplay(quote: _quote), // Display the quote
            ),
          ),
          ButtonsRow(
            onNewQuote: _getRandomQuote, // Generate new quote
            onShareQuote: _shareQuote, // Share the quote
          ),
        ],
      ),
    );
  }
}