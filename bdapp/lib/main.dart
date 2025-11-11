import 'package:bdapp/post.dart';
import 'package:bdapp/put.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:bdapp/delete.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaGet(),
    );
  }
}

class TelaGet extends StatefulWidget {
  const TelaGet({super.key});

  @override
  State<TelaGet> createState() => _TelaGetState();
}

class _TelaGetState extends State<TelaGet> {
  String? temperatura;

  @override
  void initState() {
    super.initState();
    getTemp();
  }

  void getTemp() {
    FirebaseFirestore.instance.collection("monitoramento").snapshots().listen((
      snapshot,
    ) {
      if (snapshot.docs.isNotEmpty) {
        dynamic data = snapshot.docs.first.data();
        setState(() {
          temperatura = data['temperatura'].toString();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tela de GET Firebase",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Colors.cyanAccent[100],
        foregroundColor: Colors.cyan[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              temperatura != null ? "$temperaturaº" : "Carregando...",
              style: const TextStyle(
                fontSize: 60,
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostPage()),
                );
              },
              child: const Text("Ir para tela post!"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeletePage()),
                );
              },
              child: Text("Ir para tela Delete"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PutPage()),
                );
              },
              child: Text("Ir para tela Put"),
            ),
          ],
        ),
      ),
    );
  }
}
