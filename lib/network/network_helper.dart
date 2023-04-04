import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({required this.url, required this.headers});

  final String url;
  final Map<String, String> headers;

  Future<Map> getData() async {
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      throw ('error $response.statusCode');
    }
  }
}
