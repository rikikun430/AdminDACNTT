import 'package:adminui/my_app.dart';
import 'package:adminui/screens/Order/order.dart';
import 'package:adminui/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(MyApp());
}

//TODO Text overflow right way
//TODO Confirm delete in product delete
//TODO Font case in searching
