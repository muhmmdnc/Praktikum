import 'package:flutter/material.dart';
import 'package:flutter_sqlite/database/helper.dart';
import 'package:flutter_sqlite/model/model.dart';
import 'package:flutter_sqlite/list_buku.dart'; // Import halaman daftar buku

class AddBookPage extends StatefulWidget {
  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Book')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(labelText: 'Author'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an author';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Simpan ke database
                    await DatabaseHelper().insertBook(
                      Book(
                        title: _titleController.text,
                        author: _authorController.text,
                      ),
                    );

                    // Tampilkan snackbar atau pindah halaman
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Book added!')),
                    );

                    // Navigasi ke halaman daftar buku
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BookListPage()),
                    );
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    super.dispose();
  }
}
