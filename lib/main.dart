import 'package:flutter/material.dart';
import 'package:google_api_image_app/network/network_helper.dart';
import 'package:google_api_image_app/network/query.dart';
import 'package:google_api_image_app/pages/main_page.dart';
import 'network/response_model.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
