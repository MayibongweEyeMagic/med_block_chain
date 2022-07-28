import 'package:flutter/material.dart';
import 'package:med_block_chain/pages/GeneratePasswordPage.dart';
import 'package:med_block_chain/pages/HomePage.dart';
import 'package:med_block_chain/pages/QrScanPage.dart';
import 'package:med_block_chain/pages/login_page.dart';

import 'database/connectDB.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBConnection.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: GeneratePasswordPage(),
        ),
      ),
    );
  }
}



