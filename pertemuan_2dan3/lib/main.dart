import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WhatsApp(),
    );
  }
}

class WhatsApp extends StatefulWidget {
  const WhatsApp({super.key});

  @override
  State<WhatsApp> createState() => _WhatsAppState();
}

class _WhatsAppState extends State<WhatsApp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('WhatsApp'),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            actions: const [
              Icon(Icons.more_vert),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Container(
                child: const TabBar(tabs: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.message_outlined),
                      SizedBox(width: 10),
                      Tab(text: "Chat"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_balance),
                      SizedBox(width: 10),
                      Tab(text: "Status"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.call_outlined),
                      SizedBox(width: 10),
                      Tab(text: "Calls"),
                    ],
                  ),
                ]),
              ),
            ),
          ),
          body: const TabBarView(children: [
            Center(child: Text("Hallo Chat")),
            Center(child: Text("Hallo Status")),
            Center(child: Text("Hallo Panggilan")),
          ])),
    );
  }
}
