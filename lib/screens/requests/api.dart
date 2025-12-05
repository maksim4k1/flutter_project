import 'package:http/http.dart' as http;
import 'dart:convert';

final String API_KEY = "cc63628551af4505aad21063";

Future<Map<String, dynamic>> getExchangeRateData(String baseCode) async {
  Uri url = Uri.parse("https://v6.exchangerate-api.com/v6/${API_KEY}/latest/${baseCode}");
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception("Error: ${response.reasonPhrase}");
  }
}
