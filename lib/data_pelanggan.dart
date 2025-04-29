import 'package:flutter/material.dart';

class DataPelanggan extends StatefulWidget {
  const DataPelanggan({super.key});

  @override
  State<DataPelanggan> createState() => _DataPelangganState();
}

class _DataPelangganState extends State<DataPelanggan> {
  final TextEditingController namaCustomerController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kdPosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(184, 39, 29, 109),
        title: Text('Data Pelanggan', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
    );
  }
}
