import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payapp/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:payapp/modules/insert_boleto/insert_boleto_page.dart';
import 'package:payapp/ocr_page.dart';
import 'package:payapp/shared/models/user_model.dart';

import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';
import 'modules/splash/splash_page.dart';
import 'shared/themes/app_colors.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "PayApp",
        theme: ThemeData(
            primarySwatch: Colors.green, primaryColor: AppColors.primary),
        initialRoute: "/splash",
        routes: {
          "/splash": (context) => SplashPage(),
          "/home": (context) => HomePage(user: ModalRoute.of(context)!.settings.arguments as UserModel),
          "/login": (context) => LoginPage(),
          "/barcode_scanner": (context) => BarcodeScannerPage(),
          "/ocr_page": (context) => OCRPage(),
          "/insert_boleto": (context) => InsertBoletoPage(
            barcode: ModalRoute.of(context) != null ? ModalRoute.of(context)!.settings.arguments.toString() : null,
          ),
        });
  }
}
