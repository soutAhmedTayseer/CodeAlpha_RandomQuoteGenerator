import 'dart:convert';
import 'package:http/http.dart' as http;
import 'quote.dart';

class ApiService {
  static Future<Quote> fetchRandomQuote() async {
    final response = await http.get(Uri.parse('https://api.quotable.io/random'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Quote.fromJson(json);
    } else {
      throw Exception('Failed to load quote');
    }
  }
}
