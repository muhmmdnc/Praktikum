import 'package:flutter/material.dart';

class Konten extends StatefulWidget {
  const Konten({super.key});

  @override
  State<Konten> createState() => _KontenState();
}

class _KontenState extends State<Konten> {
  int selectedNavbar = 0;

  void deteksiIndex(int index) {
    setState(() {
      selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print("Icon dilik");
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              print("Hello World");
            },
          )
        ],
      ),
      body: IndexedStack(
        index: selectedNavbar,
        children: [
          ListView(
            children: const [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.5-mDBIk0BFx0D3b7_4ZgtAHaJF?rs=1&pid=ImgDetMain"),
                ),
                title: Text("Bro"),
                subtitle: Text("Ke Kampus kgk??"),
                trailing: Text("09.52 AM"),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/john.jpg"),
                ),
                title: Text("Sis"),
                subtitle: Text("Ke Kampus kgk??"),
                trailing: Text("07.50 AM"),
              ),
            ],
          ),
          const Center(child: Text("Status")),
          const Center(child: Text("Community")),
          const Center(child: Text("Calls")),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.message_outlined),
          label: "Chat",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.flip_camera_android),
          label: "Status",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.groups_2_outlined),
          label: "Community",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.call_outlined),
          label: "Calls",
        ),
      ],
      selectedItemColor: const Color.fromARGB(255, 15, 177, 20),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      currentIndex: selectedNavbar,
      onTap: deteksiIndex,
      
      ),
    );
  }
}

konten.dart