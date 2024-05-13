import 'package:final_project_alquranapp/pages/AsmaulhusnaScreen.dart';
import 'package:final_project_alquranapp/pages/DetailSurahScreen.dart';
import 'package:final_project_alquranapp/pages/DoaScreen.dart';
import 'package:final_project_alquranapp/pages/HomeScreen.dart';
import 'package:final_project_alquranapp/pages/JadwalSholatScreen.dart';
import 'package:final_project_alquranapp/pages/LoginScreen.dart';
import 'package:final_project_alquranapp/pages/MainScreen.dart';
import 'package:final_project_alquranapp/pages/RegisterScreen.dart';
import 'package:final_project_alquranapp/pages/SplashScreen.dart';
import 'package:final_project_alquranapp/pages/SurahScreen.dart';
import 'package:final_project_alquranapp/routes/routes_name.dart';
import 'package:get/get.dart';

class pageRouteApp {
  static final page = [
    GetPage(
      name: RouteName.LOGIN,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RouteName.REGISTER,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: RouteName.SPLASHSCREEN,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: RouteName.MAINSCREEN,
      page: () => MainScreen(),
    ),
    GetPage(
      name: RouteName.SURAH,
      page: () => SurahScreen(),
    ),
    GetPage(
      name: RouteName.DETAIL_SURAH,
      page: () => DetailSurahScreen(),
    ),
    GetPage(
      name: RouteName.HOME,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: RouteName.ASMAULHUSNA,
      page: () => AsmaulHusnaScreen(),
    ),
    GetPage(
      name: RouteName.DOA,
      page: () => DoaScreen(),
    ),
    GetPage(
      name: RouteName.JADWALSHOLAT,
      page: () => JadwalSholatSc(),
    ),
  ];
}
