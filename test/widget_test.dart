import 'dart:convert';

import 'package:final_project_alquranapp/model/surah.dart';
import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse("https://api.quran.gading.dev/surah");
  var res = await http.get(url);

  // print(res.body);
  List data = (json.decode(res.body) as Map<String, dynamic>)['data'];
  print(data[113]['number']);

  // data dari api (raw data ) => model (yang sudah disimpan)

  Surah surahAnnas = Surah.fromJson(data[113]);

  print(surahAnnas);
}
