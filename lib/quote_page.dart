import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/quote.dart';
import 'package:flutter_projects/quote_display.dart';
import 'package:share_plus/share_plus.dart';
import 'api_service.dart';
import 'buttons_row.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  Quote? _quote;
  String? _backgroundImage; // To store the selected random background image
  bool _isLiked = false; // To track if the quote is liked

  // List of background images
  final List<String> _backgroundImages = [
    'assets/images/t.webp',
    'assets/images/s.jpg',
    'assets/images/v.jpg',
    'assets/images/2.jpg',
  ];

  // Fetch a random quote and a random background image
  Future<void> _getRandomQuote() async {
    final newQuote = await ApiService.fetchRandomQuote();
    setState(() {
      _quote = newQuote;
      _backgroundImage = _getRandomImage(); // Select a random image
      _isLiked = false; // Reset liked status when fetching a new quote
    });
  }

  // Get a random image from the list
  String _getRandomImage() {
    final random = Random();
    return _backgroundImages[random.nextInt(_backgroundImages.length)];
  }

  // Share the quote
  void _shareQuote() {
    if (_quote != null) {
      final String quoteText = '"${_quote!.content}"\n- ${_quote!.author}';
      if (kDebugMode) {
        print('Sharing quote: $quoteText');
      } // Debugging line
      Share.share(quoteText, subject: 'Inspiring Quote');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No quote available to share!')),
      );
    }
  }

  // Toggle the liked status
  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image with blur effect
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_backgroundImage ?? 'assets/images/s.jpg'),
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
                              constraints: const BoxConstraints(
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
                                    offset: const Offset(0, 5), // Slight shadow for depth
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  QuoteDisplay(
                                    quote: _quote,
                                  ),
                                  const SizedBox(height: 10), // Space between quote and like button
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          _isLiked ? Icons.favorite : Icons.favorite_border,
                                          color: _isLiked ? Colors.red : Colors.black,
                                          size: 30,
                                        ),
                                        onPressed: _toggleLike,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                          : const Text(
                        'Press "Generate" to get a quote!',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Space between quote and buttons
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
