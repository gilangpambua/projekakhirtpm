import 'package:flutter/material.dart';
import 'package:tpm_tugas/profil.dart';

import 'tv_show_page.dart';

class MenuUtama extends StatefulWidget {
  const MenuUtama({Key? key}) : super(key: key);

  @override
  _MenuUtamaState createState() => _MenuUtamaState();
}

class _MenuUtamaState extends State<MenuUtama> {
  int _selectedIndex = 0;
  List<Widget> _pages = [
    TVShowsPage(),
    //KonversiUangPage(),
    //KonversiWaktuPage(),
    //KesandanPesanPage(),
    ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'TV Shows',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.monetization_on),
          //   label: 'Konversi Uang',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.calendar_today),
          //   label: 'Konversi Waktu',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.mail),
          //   label: 'Kesan Pesan',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}