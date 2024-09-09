import 'dart:ui';

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

  // Fetch a random quote
  Future<void> _getRandomQuote() async {
    final newQuote = await ApiService.fetchRandomQuote();
    setState(() {
      _quote = newQuote;
    });
  }

  // Share the quote
  void _shareQuote() {
    if (_quote != null) {
      final String quoteText = '"${_quote!.content}"\n- ${_quote!.author}';
      Share.share(quoteText, subject: 'Inspiring Quote');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No quote available to share!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color appBarColor = Colors.black; // Black color for the AppBar
    final Color textColor = Colors.white; // White text color

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Random Quote Generator',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: textColor, // White text color
          ),
        ),
        backgroundColor: appBarColor, // Set the AppBar color to black
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image with blur effect
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/s.jpg'), // Replace with your background image
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1), // Darken the background for better contrast
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                // Expanded to fill the remaining space
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: _quote != null
                          ? AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: Column(
                          key: ValueKey<Quote>(_quote!), // Unique key for each quote
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 400, // Max width of the quote display
                              ),
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8), // Slightly transparent background
                                borderRadius: BorderRadius.circular(15), // Rounded corners
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: Offset(0, 5), // Slight shadow for depth
                                  ),
                                ],
                              ),
                              child: QuoteDisplay(
                                quote: _quote,
                              ),
                            ),
                          ],
                        ),
                      )
                          : Text(
                        'Press "New Quote" to get a quote!',
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20), // Space between quote and buttons
                ButtonsRow(
                  onNewQuote: _getRandomQuote,
                  onShareQuote: _shareQuote,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
