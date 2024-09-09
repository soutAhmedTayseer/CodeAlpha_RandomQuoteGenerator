import 'package:flutter/material.dart';

class ButtonsRow extends StatelessWidget {
  final VoidCallback onNewQuote;
  final VoidCallback onShareQuote;

  const ButtonsRow({
    required this.onNewQuote,
    required this.onShareQuote,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const Color buttonColor = Colors.white; // Background color for buttons
    const Color textColor = Colors.black; // Text and icon color for buttons

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: onNewQuote,
          style: ElevatedButton.styleFrom(
            foregroundColor: textColor, backgroundColor: buttonColor, // Set text and icon color
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(fontSize: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.format_quote, color: textColor), // Icon color
              SizedBox(width: 8),
              Text('Generate   ', style: TextStyle(color: textColor)), // Text color
            ],
          ),
        ),
        ElevatedButton(
          onPressed: onShareQuote,
          style: ElevatedButton.styleFrom(
            foregroundColor: textColor, backgroundColor: buttonColor, // Set text and icon color
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(fontSize: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.share, color: textColor), // Icon color
              SizedBox(width: 8),
              Text('  Share  ', style: TextStyle(color: textColor)), // Text color
            ],
          ),
        ),
      ],
    );
  }
}
