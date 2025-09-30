import 'package:appassetsgi/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; //Biblioteca de urls

class Tela2 extends StatefulWidget {
  const Tela2({super.key});

  @override
  State<Tela2> createState() => _Tela2State();
}

String mensagem = "";

//Função dart para levar o usuário a videos diferentes com base nos cliques
class _Tela2State extends State<Tela2> {
  // Função para abrir link no navegador
  Future<void> _abrirLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Não foi possível abrir: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Blog dos gatinhos")), //barra superior
        body: Center(
          //Ajuda a centralizar
          child: Column(
            //elementos um abaixo do outro
            children: [
              Text("Escolha um gatinho: "),

              // GATINHO 1
              GestureDetector(
                onTap: () {
                  setState(() {
                    mensagem = "SURPRESAA do Gatinhos fofos pra você";
                  });

                  _abrirLink(
                    "https://youtube.com/shorts/iiCemZxxopU?si=YQBkpnDWt18yH05E",
                  ); // link do vídeo
                },
                child: Image.network(
                  "https://i.pinimg.com/236x/c8/b2/f2/c8b2f2e7e394e9daa79c8f8faad02931.jpg",
                  width: 350,
                ),
              ),

              //GATINHO 2
              GestureDetector(
                onTap: () {
                   setState(() {
                    mensagem = "SURPRESAA videos de gatinhos engraçados pra você";
                  });

                  _abrirLink(
                    "https://youtube.com/shorts/ZBbOn4JzlMo?si=jk1LOV--LFX8mIf9",
                  ); // outro vídeo
                  Text("SURPRESAA");
                },
                child: Image.asset(
                  "assets/images/imagemgatinhoengracado.jpg",
                  width: 350,
                ),
              ),

              const SizedBox(height: 20),
              const Text("SURPRESAAA!"),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaHome()),
                  );
                },
                child: const Icon(Icons.arrow_back_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
