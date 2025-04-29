import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class PiketGudang extends StatefulWidget {
  final String email;
  const PiketGudang({super.key, required this.email});

  @override
  State<PiketGudang> createState() => _PiketGudangState();
}

class _PiketGudangState extends State<PiketGudang> {
  final TextEditingController tugasController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  String? dateError;
  List<Map<String, dynamic>> listPiket = [];

  void _tambahDataPiket() {
    if (!_formKey.currentState!.validate() || selectedDate == null) {
      setState(() {
        dateError = selectedDate == null ? 'Tanggal tidak boleh kosong' : null;
      });
      return;
    }
    setState(() {
      String displayName = widget.email;
      listPiket.add({
        'nama': displayName,
        'tanggal': selectedDate,
        'tugas': tugasController.text,
      });
      tugasController.clear();
      selectedDate = null;
      dateError = null;
    });
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', '').then((_) {
      Intl.defaultLocale = 'id_ID';
    });
  }

  Future<void> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateError = null;
      });
    }
  }

  String _formatTanggal(DateTime? date) {
    if (date == null) return 'Pilih tanggal';
    return DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(date);
  }

  @override
  Widget build(BuildContext context) {
    String displayName = widget.email;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(184, 39, 29, 109),
        title: const Text(
          'Piket Gudang',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          onPressed:
              () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Nama Anggota',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: displayName,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Pilih Tanggal',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => _selectedDate(context),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_month, color: Colors.black),
                      const SizedBox(width: 10),
                      Text(
                        selectedDate != null
                            ? _formatTanggal(selectedDate)
                            : 'Pilih Tanggal',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              if (dateError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    dateError!,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),
              const SizedBox(height: 16),
              const Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Tugas Piket',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: tugasController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.5,
                          ),
                        ),
                        hintText: 'Tugas Piket',
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tugas tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _tambahDataPiket,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(184, 39, 29, 109),
                      fixedSize: const Size(180, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Tambah',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Daftar Tugas Piket',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 300,
                child:
                    listPiket.isEmpty
                        ? Center(
                          child: Text(
                            'Belum ada Data',
                            style: TextStyle(fontSize: 15),
                          ),
                        )
                        : ListView.builder(
                          itemCount: listPiket.length,
                          itemBuilder: (context, index) {
                            final piket = listPiket[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              color: Color.fromARGB(184, 39, 29, 109),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      piket['tugas'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      ),
                                      iconSize: 20,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
