import 'package:flutter/material.dart';
import 'package:flutter_sqlite/book.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';  // Tambahkan ini untuk platform desktop
import 'dart:io';


void main() {
  // Inisialisasi databaseFactory untuk platform desktop
  if (isDesktopPlatform()) {
    // Inisialisasi untuk desktop (Windows, macOS, atau Linux)
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi; // Inisialisasi databaseFactory
  }

  runApp(MyApp());
}

// Fungsi untuk memeriksa apakah aplikasi dijalankan di platform desktop
bool isDesktopPlatform() {
  return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter SQLite Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Press the button to add a new book'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Arahkan ke halaman AddBookPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddBookPage()),
                );
              },
              child: Text('Add New Book'),
            ),
          ],
        ),
      ),
    );
  }
}
