import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = "http://127.0.0.1:5000/api/scrape_purchase";

  Future<Map<String, dynamic>?> postPurchaseDetails(String url) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"url": url}),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception("Failed to load purchase details");
      }
    } catch (e) {
      print("Error during HTTP request: $e");
      return null;
    }
  }
}
