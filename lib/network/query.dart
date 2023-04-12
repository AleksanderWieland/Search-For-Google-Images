import '../private_keys/api_key.dart';

class Query {
  Map<String, String> queryHeaders(String query) {
    Map<String, String> queryHeaders = {
      'key': apiKey,
      //programmable search engine ID
      'cx': 'b255dbe9f50bb4003',
      'q': query,
    };
    return queryHeaders;
  }
}
