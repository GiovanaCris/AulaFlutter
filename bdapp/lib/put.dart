import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PutPage extends StatefulWidget {
  const PutPage({super.key});

  @override
  State<PutPage> createState() => _PutPageState();
}

class _PutPageState extends State<PutPage> {
  List<dynamic>? valores; //Lista que recebe os valores do banco
  Map<String, TextEditingController> controladores = {}; //Map para colocar um variável obsevadora em cada campo de texto


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
        for (dynamic doc in data){
          controladores[doc.id] =TextEditingController(); //Para cada documento retornado, tenho um textediting exclusivo
        }
      });
    });
  }

  //Função futura put value
  //Precisa saber o Id do documento para poder alterá-lo
  Future<void> PutValue(String id) async{
    FirebaseFirestore.instance.collection("monitoramento").doc(id).set(
      {
        "temperatura": controladores[id]!.text,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Tela de Put")),
        body: valores == null? Center(child: CircularProgressIndicator()) :
        ListView.builder(itemCount: valores! .length,
        itemBuilder: (context,index){
          final item = valores![index];
          return ListTile(
            title: Text("Temperatura atual: ${item["temperatura"]}"),
            subtitle: Column(
              children: [
                TextField(controller: controladores[item.id]),
                ElevatedButton(onPressed: (){PutValue(item.id);}, child: Text("Alterar"))
              ],
            ),
          );
        },
        )
      ),
    );
  }
}
