import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class TransaksiBarang extends StatefulWidget {
  const TransaksiBarang({super.key});

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
          onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
