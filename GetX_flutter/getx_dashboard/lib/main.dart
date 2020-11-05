import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import './utility/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    title: 'GetX App',
    debugShowCheckedModeBanner: false,
    // defaultTransition is used for navigating with animation.
    defaultTransition: Transition.rightToLeft,
    // getPages is the parameter that will hold all of the routes.
    getPages: GetXRouter.route,
    // initialRoute is used to specify the launch screen of your application
    initialRoute: 'loginView',
    theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        appBarTheme: AppBarTheme(
            color: Colors.deepOrange,
            textTheme: TextTheme(
                headline6: GoogleFonts.exo2(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )))),
  ));
}
