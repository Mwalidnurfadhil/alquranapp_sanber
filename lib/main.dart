import 'package:final_project_alquranapp/controller/authController.dart';
import 'package:final_project_alquranapp/routes/page_routes.dart';
import 'package:final_project_alquranapp/routes/routes_name.dart';
import 'package:final_project_alquranapp/utils/Loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus(),
      builder: (context, snapshot) {
        // print(snapshot);
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            title: 'Application',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: snapshot.data != null
                ? RouteName.MAINSCREEN
                : RouteName.SPLASHSCREEN,
            getPages: pageRouteApp.page,
            // home: MainScreen(),
            // home: snapshot.data != null ? MainScreen() : SplashScreen(),
          );
        }
        return LoadingView();
      },
    );
  }
}
