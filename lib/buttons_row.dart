import 'package:flutter/material.dart';

class ButtonsRow extends StatelessWidget {
  final VoidCallback onNewQuote;
  final VoidCallback onShareQuote;

  const ButtonsRow({
    required this.onNewQuote,
    required this.onShareQuote,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = Colors.white; // Background color for buttons
    final Color textColor = Colors.black; // Text and icon color for buttons

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: onNewQuote,
          style: ElevatedButton.styleFrom(
            foregroundColor: textColor, backgroundColor: buttonColor, // Set text and icon color
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: TextStyle(fontSize: 22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.refresh, color: textColor), // Icon color
              SizedBox(width: 8),
              Text('New Quote', style: TextStyle(color: textColor)), // Text color
            ],
          ),
        ),
        ElevatedButton(
          onPressed: onShareQuote,
          style: ElevatedButton.styleFrom(
            foregroundColor: textColor, backgroundColor: buttonColor, // Set text and icon color
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: TextStyle(fontSize: 22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.share, color: textColor), // Icon color
              SizedBox(width: 8),
              Text('Share', style: TextStyle(color: textColor)), // Text color
            ],
          ),
        ),
      ],
    );
  }
}
