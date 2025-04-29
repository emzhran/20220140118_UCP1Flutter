import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ucp1_118/detail_transaksi.dart';

class TransaksiBarang extends StatefulWidget {
  final String emailLogin;
  const TransaksiBarang({
    super.key,
    required this.emailLogin});

  @override
  State<TransaksiBarang> createState() => _TransaksiBarangState();
}

class _TransaksiBarangState extends State<TransaksiBarang> {
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  String? dateError;

  final Map<String, int> jenisHargaBarang = {
    'Carrier': 30000,
    'Sleeping Bag': 15000,
    'Tenda': 35000,
    'Sepatu': 25000,
  };

  String? selectedJenisTransaksi;
  String? selectedJenisBarang;

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(184, 39, 29, 109),
        title: const Text(
          'Pendataan Barang',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
              const SizedBox(height: 16),
              const Text(
                'Tanggal Transaksi',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                readOnly: true,
                controller: TextEditingController(
                  text: _formatTanggal(selectedDate),
                ),
                onTap: () => _selectedDate(context),
                decoration: InputDecoration(
                  hintText: 'Pilih tanggal',
                  prefixIcon: const Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Jenis Transaksi',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedJenisTransaksi,
                items: ["Masuk", "Keluar"]
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      ),
                    )
                    .toList(),
                onChanged: (val) => setState(() => selectedJenisTransaksi = val),
                decoration: InputDecoration(
                  hintText: "Jenis Transaksi",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pilih jenis transaksi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Jenis Barang',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedJenisBarang,
                items: jenisHargaBarang.keys
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      ),
                    )
                    .toList(),
                onChanged: (val) => setState(() {
                  selectedJenisBarang = val;
                  hargaController.text = jenisHargaBarang[val!]!.toString();
                }),
                decoration: InputDecoration(
                  hintText: "Jenis Barang",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pilih jenis barang';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: jumlahController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Jumlah Barang",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Jumlah barang tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: hargaController,
                      readOnly: true,
                      decoration: InputDecoration(
                        prefixText: 'Rp. ',
                        hintText: 'Harga Satuan',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Harga satuan tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final jumlah = int.tryParse(jumlahController.text) ?? 0;
                    final harga = jenisHargaBarang[selectedJenisBarang ?? ''] ?? 0;
                    final total = jumlah * harga;
                    final tanggalFormatted = _formatTanggal(selectedDate);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailTransaksi(
                          tanggal: tanggalFormatted,
                          jenisTransaksi: selectedJenisTransaksi ?? '',
                          jenisBarang: selectedJenisBarang ?? '',
                          jumlah: jumlah,
                          harga: harga,
                          total: total,
                          email: widget.emailLogin,
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Color.fromARGB(184, 39, 29, 109),
                  minimumSize: const Size(400, 50),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
