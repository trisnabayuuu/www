import 'dart:convert';

import 'package:http/http.dart' as http;
class Pelanggan {
  final String name;
  final String alamat;
  final String keterangan;

  const Pelanggan({
    required this.name,
    required this.alamat,
    required this.keterangan
  });

  factory Pelanggan.fromJson(Map<String, dynamic> json) {
    return Pelanggan(
      name: json['name'] as String,
      alamat: json['alamat'] as String,
      keterangan: json['keterangan'] as String,
    );
  }
}

class Api{
  final baseUrl = 'http://127.0.0.1:8000/api/resign';


  Future getData() async{
  try{
    final response = await http.get(Uri.parse(baseUrl));

    if(response.statusCode == 200){
      // print(response.body);
      Iterable it = jsonDecode(response.body)['data'];
      List<Pelanggan> pelanggan = it.map((e) => Pelanggan.fromJson(e)).toList();
      return pelanggan;
    };
  } catch (e) {

  }

}
}