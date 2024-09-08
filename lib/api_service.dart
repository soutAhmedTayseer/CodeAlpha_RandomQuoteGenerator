import 'dart:convert';
import 'package:flutter_projects/quote.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Quote?> fetchRandomQuote() async {
    final url = Uri.parse('https://api.quotable.io/random');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Quote.fromJson(data);
      }
    } catch (error) {
      print("Error fetching quote: $error");
    }
    return null;
  }
}

