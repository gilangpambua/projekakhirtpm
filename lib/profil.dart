import 'package:flutter/material.dart';
import 'detail_profil.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  void _logout() async {
    // Simpan status login ke false atau hapus data user yang sedang login
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    // Navigasi ke halaman login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => loginpage(title: 'Login')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.blue[900],
        elevation: 0,
      ),
      body: SingleChildScrollView(
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailProfilPage()),
                  );
                },
                child: Text(
                  "Lihat Detail",
                  style: TextStyle(fontSize: 12),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 4,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _logout,
                child: Text(
                  "Logout",
                  style: TextStyle(fontSize: 12),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
