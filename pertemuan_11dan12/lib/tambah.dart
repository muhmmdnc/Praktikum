import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart'; // Import ini diperlukan

class AddBook extends StatelessWidget {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _penulisController = TextEditingController();
  final TextEditingController _tahunTerbitController = TextEditingController();

  AddBook({super.key});

  Future<void> addBook(BuildContext context) async {
    if (_judulController.text.isEmpty ||
        _penulisController.text.isEmpty ||
        _tahunTerbitController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua field harus diisi!')),
      );
      return; // Hentikan eksekusi jika ada field yang kosong
    }

    // Validasi tahun terbit
    if (_tahunTerbitController.text.length != 4 ||
        int.tryParse(_tahunTerbitController.text) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tahun terbit harus 4 digit!')),
      );
      return;
    }

    // Validasi jika lebih dari 4 digit
    if (_tahunTerbitController.text.length > 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tahun terbit tidak boleh lebih dari 4 digit!')),
      );
      return;
    }

    final response = await http.post(
      Uri.parse('http://localhost/CRUD_API/create.php'), // Ganti dengan URL API Anda
      body: {
        'judul': _judulController.text,
        'penulis': _penulisController.text,
        'tahun_terbit': _tahunTerbitController.text,
      },
    );

    if (response.statusCode == 201) {
      print('Buku berhasil ditambahkan');
      Navigator.pop(context); // Kembali ke daftar buku
    } else {
      throw Exception('Gagal menambahkan buku');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Buku'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _judulController,
              decoration: const InputDecoration(labelText: 'Judul'),
            ),
            TextField(
              controller: _penulisController,
              decoration: const InputDecoration(labelText: 'Penulis'),
            ),
            TextField(
              controller: _tahunTerbitController,
              decoration: const InputDecoration(labelText: 'Tahun Terbit'),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4), // Batasi input menjadi 4 karakter
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => addBook(context), // Pass context to the function
              child: const Text('Simpan Buku'),
            ),
          ],
        ),
      ),
    );
  }
}
