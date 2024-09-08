import 'package:flutter/material.dart';
import 'package:flutter_projects/quote.dart';

class QuoteDisplay extends StatelessWidget {
  final Quote? quote;

  QuoteDisplay({this.quote});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (quote != null) ...[
          Text(
            quote!.content,
            style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          SizedBox(height: 10),
          Text(
            '- ${quote!.author}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
        ],
      ],
    );
  }
}
