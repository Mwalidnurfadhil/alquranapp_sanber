import 'dart:convert';

import 'package:final_project_alquranapp/model/surah.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SurahController extends GetxController {
  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse("https://api.quran.gading.dev/surah");
    var res = await http.get(url);

    List? data = (json.decode(res.body) as Map<String, dynamic>)['data'];
    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
    // Surah surahAnnas = Surah.fromJson(data[113]);
  }
}
