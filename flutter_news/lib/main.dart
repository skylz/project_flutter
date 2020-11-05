import 'package:flutter_news/screen/homeNewsScreen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './utility/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    title: 'Hello Flutter News App',
    debugShowCheckedModeBanner: false,
    defaultTransition: Transition.rightToLeft,
    getPages: GetXRouter.route,
    initialRoute: 'homeNewsScreen',
    theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        appBarTheme: AppBarTheme(
            color: Colors.deepOrange,
            textTheme: TextTheme(
                headline6: GoogleFonts.exo2(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)))),
  ));
}
