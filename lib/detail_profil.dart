import 'package:flutter/material.dart';

class DetailProfilPage extends StatefulWidget {
  @override
  _DetailProfilPageState createState() => _DetailProfilPageState();
}

class _DetailProfilPageState extends State<DetailProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('images/profile1.jpg'),
                  radius: 50,
                ),
                ListTile(
                  leading: Icon(Icons.assignment_ind),
                  title: Text('NIM : 123200027'),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Nama : Gilang Pappa Tanto Pambua'),
                ),
                ListTile(
                  leading: Icon(Icons.class__rounded),
                  title: Text('Kelas : Prak Teknologi Dan Pemrograman Mobile IF-B'),
                ),
                ListTile(
                  leading: Icon(Icons.cake),
                  title: Text('Tempat, Tanggal Lahir : Rantepao, 8 September 2002'),
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Harapan / Cita-cita : Menjadi Network Security Engineer'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/profile2.jpg'),
                  radius: 50,
                ),
                ListTile(
                  leading: Icon(Icons.assignment_ind),
                  title: Text('NIM : 123200043'),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Nama : Jeremy Kevin Alexandro Sitorus'),
                ),
                ListTile(
                  leading: Icon(Icons.class__rounded),
                  title: Text('Kelas : Prak Teknologi Dan Pemrograman Mobile IF-B'),
                ),
                ListTile(
                  leading: Icon(Icons.cake),
                  title: Text('Tempat, Tanggal Lahir : Medan, 7 Desember 2002'),
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Harapan / Cita-cita : Masuk surga'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
