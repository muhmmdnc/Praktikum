import 'package:flutter/material.dart';
import 'package:flutter_sqlite/database/helper.dart';
import 'package:flutter_sqlite/model/model.dart';

class BookListPage extends StatefulWidget {
  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  List<Book> _books = [];

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  Future<void> _loadBooks() async {
    _books = await DatabaseHelper().getBooks(); // Ambil daftar buku dari database
    setState(() {}); // Refresh tampilan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
      ),
      body: _books.isEmpty
          ? Center(child: Text('No books available.'))
          : ListView.builder(
              itemCount: _books.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_books[index].title),
                  subtitle: Text(_books[index].author),
                );
              },
            ),
    );
  }
}
