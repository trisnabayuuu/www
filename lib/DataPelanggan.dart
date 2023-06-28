import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api.dart';

class HalamanPelanggan extends StatefulWidget {
  @override
  State<HalamanPelanggan> createState() => _HalamanPelangganState();
}

class _HalamanPelangganState extends State<HalamanPelanggan> {
  List<Pelanggan> listpelanggan = [];
  Api api = Api();

  getData() async {
    listpelanggan = await api.getData();
    setState(() {});
  }
@override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Pelanggan"),
        backgroundColor: const Color.fromARGB(197, 36, 22, 2),
      ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            var pelanggan = listpelanggan[index];
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('name: ${pelanggan.title}'),
                  // Text('address: ${pelanggan.address}'),
                  Text('descriptiom: ${pelanggan.description}'),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: listpelanggan.length,
        )
    );
  }
}