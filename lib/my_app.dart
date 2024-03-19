// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:adminui/screens/DashBoard.dart';
import 'package:adminui/screens/Order/order.dart';
import 'package:adminui/screens/home.dart';
import 'package:adminui/screens/login.dart';
import 'package:adminui/screens/new_product_page.dart';
import 'package:adminui/screens/product_group_page.dart';
import 'package:adminui/screens/splash.dart';
import 'package:adminui/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Warehouse Management',
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: ColorPalette.white)),
      // home: FutureBuilder(
      //   // future: _initialization,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       // final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      //       return StreamBuilder<User?>(
      //         // stream: firebaseAuth.authStateChanges(),
      //         builder: (context, snapshot) {
      //           if (snapshot.hasData && !snapshot.data!.isAnonymous) {
      //             return Home();
      //           } else {
      //             return Login();
      //           }
      //         },
      //       );
      //     }
      //     return Splash();
      //   },
      // ),
      home: Home(),
    );
  }
}

class User {}
