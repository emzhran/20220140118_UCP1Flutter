import 'package:flutter/material.dart';
import 'package:ucp1_118/home_page.dart';

class DetailPelanggan extends StatelessWidget {
  final String emailHome;
  final String nama;
  final String email;
  final String noHp;
  final String alamat;
  final String provinsi;
  final String kodePos;

  const DetailPelanggan({
    super.key,
    required this.nama,
    required this.email,
    required this.noHp,
    required this.alamat,
    required this.provinsi,
    required this.kodePos,
    required this.emailHome
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(184, 39, 29, 109),
        title: Text('Detail $nama',
        style: TextStyle(
          color: Colors.white
        ),
        ),
        leading: IconButton(
          onPressed: (){}, 
          icon: Icon(Icons.arrow_back, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('./assets/image/donatello.png'),
              ),
              SizedBox(height: 16),
              Text(nama, style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(email, style: TextStyle(
                fontSize: 18),
              ),
              SizedBox(height: 4),
              Text(noHp, style: TextStyle(
                fontSize: 16),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Alamat',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                )),
              ),
              SizedBox(height: 4),
              TextFormField(
                initialValue: alamat,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Provinsi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        TextFormField(
                          initialValue: provinsi,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 14,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Kode Pos',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )
                        ),
                        SizedBox(height: 4),
                        TextFormField(
                          initialValue: kodePos,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => HomePage(email: emailHome)));
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor:  Color.fromARGB(184, 39, 29, 109),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                  )
                  ),
                  child: Text('Selesai',
                  style: TextStyle(
                    color: Colors.white
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
