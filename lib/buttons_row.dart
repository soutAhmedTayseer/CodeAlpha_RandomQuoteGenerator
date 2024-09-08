import 'package:flutter/material.dart';

class ButtonsRow extends StatelessWidget {
  final VoidCallback onNewQuote;
  final VoidCallback onShareQuote;

  ButtonsRow({required this.onNewQuote, required this.onShareQuote});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: onNewQuote,
            child: Row(
              children: [
                Icon(Icons.format_quote),
                SizedBox(width: 8),
                Text('New Quote'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onShareQuote,
            child: Row(
              children: [
                Icon(Icons.share),
                SizedBox(width: 8),
                Text('Share'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

