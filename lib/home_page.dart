import 'package:flutter/material.dart';
import 'package:ucp1_118/data_pelanggan.dart';
import 'package:ucp1_118/login_page.dart';
import 'package:ucp1_118/piket_gudang.dart';
import 'package:ucp1_118/transaksi_barang.dart';

class HomePage extends StatelessWidget {
  final String email;

  const HomePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    String displayName = email;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(184, 39, 29, 109),
        toolbarHeight: 100,
        flexibleSpace: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Image(
                  image: AssetImage('./assets/image/donatello.png'),
                  width: 55,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Selamat Datang",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    displayName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.logout, color: Colors.white),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 155),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              child: Container(
                color: Colors.grey[300],
                height: 200,
                width: double.infinity,
                child: Center(
                  child: Image(
                    image: AssetImage('./assets/image/AreiExplore.png'),
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context)=>PiketGudang(email: email)));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(184, 39, 29, 109),
                          padding: const EdgeInsets.all(30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.work_history, color: Colors.white, size: 40),
                            const SizedBox(height: 10),
                            const Text('Data Piket',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => DataPelanggan(email: email)));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(184, 39, 29, 109),
                        padding: const EdgeInsets.all(30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ), 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.people, color: Colors.white, size: 40),
                          const SizedBox(height: 10),
                          const Text('Data Pelanggan',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TransaksiBarang(emailLogin: email)));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(184, 39, 29, 109),
                      padding: const EdgeInsets.all(40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ), 
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.inventory, color: Colors.white, size: 50),
                        const SizedBox(height: 15),
                        const Text('Barang Masuk/Keluar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
