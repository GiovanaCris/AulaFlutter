import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({super.key});

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  //Aqui você coda a lógica
  List<dynamic>? valores; //lista que irá receber os dados do banco

  @override
  void initState() {
    //reiniciar a página
    super.initState();
    getValues();
  }

  void getValues() async {
    //Crio uma instancia do firebase na coleção monitoramento
    //Os retornos (snapshots) --> Intantaneo
    //ouvir/listar os retornos (listen)
    FirebaseFirestore.instance.collection("monitoramento").snapshots().listen((
      snapshots,
    ) {
      final data =
          snapshots.docs; //variavel que conte todos os registros do banco
      setState(() {
        valores = data;
      });
    });
  }

  //função futura pois a validação acontece depois da requisição no APP
  //Precisa receber um id para deletar o documento == registro
  //Id no FireBase sempre é String . Exemplo: "897877bsbsb!#"
  Future<void> deleteValue(String id) async {
    FirebaseFirestore.instance.collection("monitoramento").doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Tela e Delete")),
        body: valores == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: valores!
                    .length, //Quantos itens irei criar? R: O tamanho da lista valores.
                itemBuilder: (context, index) {
                  //O que irei criar
                  final item = valores![index];
                  return ListTile(
                    //Card
                    title: Text("Temperatura"),
                    subtitle: Text("${item["temperatura"]}"),
                    trailing: GestureDetector(
                      //Detecta um gesto e atribui uma funcao para um icone
                      child: Icon(Icons.remove),
                      onTap: () {
                        deleteValue(item.id);
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
