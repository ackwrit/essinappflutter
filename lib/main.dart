import 'package:firstappesin/controller/handlerPermission.dart';
import 'package:firstappesin/view/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HanlderPermission().init();
  Stripe.publishableKey = "pk_test_QQ6EqdeL67aoCecNqLETZVke00kNCuIBte";
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
              systemOverlayStyle:  SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.light
              )
          )
      ),
      darkTheme: ThemeData.dark().copyWith(

        appBarTheme: const AppBarTheme(
          systemOverlayStyle:  SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark
          )
        )

      ),
      home: const LandinPageView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

