import 'dart:convert';

import 'package:http/http.dart' as http;
class Pelanggan {
  final String title;
  final String description;
  // final String address;

  const Pelanggan({
    required this.title,
    required this.description,
    // required this.address,
  });

  factory Pelanggan.fromJson(Map<String, dynamic> json) {
    return Pelanggan(
      title: json['title'] as String,
      description: json['description'] as String,
      // address: json['address'] as String,
    );
  }
}

class Api{
  final baseUrl = 'https://dummyjson.com/products';


  Future getData() async{
  try{
    final response = await http.get(Uri.parse(baseUrl));

    if(response.statusCode == 200){
      print(response.body);
      Iterable it = jsonDecode(response.body)['products'];
      List<Pelanggan> pelanggan = it.map((e) => Pelanggan.fromJson(e)).toList();
      return pelanggan;
    }
  } catch (e) {
    // throw Exception('An error occurred');
  }

}
}