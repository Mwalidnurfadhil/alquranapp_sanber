import 'dart:convert';

import 'package:final_project_alquranapp/model/detail_surah.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailSurahController extends GetxController {
  Future<DetailSurah> getDetailSurah(String id) async {
    Uri url = Uri.parse("https://api.quran.gading.dev/surah/$id");
    var res = await http.get(url);

    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)['data'];

    return DetailSurah.fromJson(data);

    // Surah surahAnnas = Surah.fromJson(data[113]);
  }
}
