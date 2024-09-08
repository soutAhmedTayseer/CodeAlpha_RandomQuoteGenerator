import 'package:flutter/material.dart';
import 'package:flutter_projects/quote.dart';

class QuoteDisplay extends StatelessWidget {
  final Quote? quote;

  const QuoteDisplay({this.quote});

  @override
  Widget build(BuildContext context) {
    final Color cardBackgroundColor = Colors.white12;

    return Container(
      padding: const EdgeInsets.all(16.0), // Padding around the text
      decoration: BoxDecoration(
        color: cardBackgroundColor, // Card background color
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Shadow color with opacity
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: SingleChildScrollView( // Added scroll view
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
          children: [
            if (quote != null) ...[
              // Display tags centered at the top of the card
              if (quote!.tags.isNotEmpty) ...[
                Align(
                  alignment: Alignment.topCenter,
                  child: Wrap(
                    spacing: 8.0, // Space between tags
                    runSpacing: 4.0, // Space between lines of tags
                    alignment: WrapAlignment.center, // Center tags horizontally
                    children: quote!.tags.map((tag) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color: cardBackgroundColor, // Background color matches card
                        borderRadius: BorderRadius.circular(8.0), // Rounded corners for the tag
                        border: Border.all(color: Colors.black), // Optional: add border if needed
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          fontSize: 20, // Larger font size for tags
                          color: Colors.black, // Tag text color
                          fontWeight: FontWeight.bold, // Bold text
                        ),
                      ),
                    )).toList(),
                  ),
                ),
                const SizedBox(height: 16), // Space between tags and quote
              ],
              Text(
                quote!.content,
                style: const TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  color: Colors.black, // Adjust text color if needed
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40), // Space between quote and author
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  '- ${quote!.author}',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Adjust text color if needed
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
