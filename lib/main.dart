// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/controllers/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pas_xi_kereta/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final bool? isAdmin = prefs.getBool('isAdmin');

  String initialRoute;
  if (isAdmin == true) {
    initialRoute = Routes.ADMIN;
  } else {
    initialRoute = Routes.HOME;
  }
  print(initialRoute);
  runApp(MyApp(
    initialRoute: initialRoute,
  ));
}

class MyApp extends StatefulWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final auth = Get.put(AuthController());

  // bool? isAdmin;
  // String? login;

  // cekData() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     if (prefs.getBool('isAdmin') != null) {
  //       isAdmin = prefs.getBool('isIntro');
  //     } else {
  //       isAdmin = false;
  //     }
  //     if (prefs.getString('isLogin') != null) {
  //       login = prefs.getString('isLogin');
  //     }
  //   });
  // }

  // @override
  // void initState() {
  //   cekData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    print('================================================================');
    // print(isAdmin);
    return StreamBuilder(
      stream: auth.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            title: "Application",
            initialRoute:
                snapshot.data != null ? widget.initialRoute : Routes.LOGIN,
            getPages: AppPages.routes,
            debugShowCheckedModeBanner: false,
          );
        } else {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
