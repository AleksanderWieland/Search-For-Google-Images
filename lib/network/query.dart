import '../private_keys/api_key.dart';

class Query {
  Query(this._query);

  String _query;

  Map<String, String> _queryHeaders() {
    Map<String, String> queryHeaders = {
      'key': apiKey,
      //programmable search engine ID
      'cx': 'b255dbe9f50bb4003',
      'q': _query,
    };
    return queryHeaders;
  }

  Map<String, String> get queryHeaders {
    return _queryHeaders();
  }

  void set setQuery(String query) {
    _query = query;
  }
}
