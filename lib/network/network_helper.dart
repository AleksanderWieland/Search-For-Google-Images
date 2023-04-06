import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({required this.url, required this.params});

  final String url;
  final Map<String, dynamic> params;

  Future<Map<String, dynamic>> getData() async {
    Uri uri = Uri.parse(url).replace(queryParameters: params);
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      throw ('error $response.statusCode');
    }
  }
}
