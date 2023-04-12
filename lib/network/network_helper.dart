import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({required this.url});

  final String url;

  Future<Map<String, dynamic>> getData(Map<String, dynamic> params) async {
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
