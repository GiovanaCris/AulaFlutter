import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Função para inicializar os componentes que utiliza o firebase
  await Firebase.initializeApp(
    //aguarda o forebase inicializar
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TelaGet());
  }
}

class TelaGet extends StatefulWidget {
  const TelaGet({super.key});

  @override
  State<TelaGet> createState() => _TelaGetState();
}

class _TelaGetState extends State<TelaGet> {
  String?
  temperatura; //Variavel double, pode ser nula, caso o database não exista

  @override
  void initState() {
    super.initState();
    gettemp();
  }

  void gettemp() {
    //collection é o nome da sua coleção, precisa ser o mesmo nome escolhido no banco de dados
    FirebaseFirestore.instance.collection("monitoramento").snapshots().listen((
      snapshot,
    ) {
      //o que você irá fazer para cada um?
      dynamic data = snapshot.docs.first
          .data(); //Data == ao primeiro documento que tem no seu banco
      setState(() {
        temperatura = data['temperatura'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Tela de GET Firebase",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          toolbarHeight: 100,
          backgroundColor: Colors.cyan[50],
          foregroundColor: Colors.cyan,
        ),
        body: Center(
          child: Text(
            "$temperaturaº",
            style: TextStyle(
              fontSize: 60,
              color: Colors.cyan,
              fontWeight: FontWeight.bold,
            ), // opcional, só pra destacar
          ),
        ),
      ),
    );
  }
}
