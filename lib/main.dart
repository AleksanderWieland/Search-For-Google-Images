// import 'package:flutter/material.dart';
import 'package:google_api_image_app/network/network_helper.dart';
import 'package:google_api_image_app/network/query.dart';

import 'network/response_model.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  String url = "https://customsearch.googleapis.com/customsearch/v1";
  Map<String, dynamic> query = Query('water').queryHeaders;
  NetworkHelper newtorkHelper = NetworkHelper(url: url, params: query);
  Map<String, dynamic> data = await newtorkHelper.getData();
  print(data['imageobject']);
  Pagemap pagemap = Pagemap.fromJson(data);
  print(pagemap.toJson());

  // runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
