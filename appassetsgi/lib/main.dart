import 'package:appassetsgi/tela2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TelaHome());
  }
}

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //promove os componentes para a minh atela
      theme: ThemeData(
        textTheme:
            GoogleFonts.robotoTextTheme(), //Deixa uma fonte padrão em toda a aplicação
      ),
      //promove os componentes na minha tela
      debugShowCheckedModeBanner:
          false, //tira a fitinha vermelha do canto da tela
      home: Scaffold(
        //Separa a tela entre appbar e body
        appBar: AppBar(title: Text("Olá 💜")), //barra superior
        body: Center(
          //Ajuda a centralizar
          child: Column(
            //elementos um abaixo do outro
            children: [
              //Vários filhos
              Image.network(
                "https://i.pinimg.com/736x/85/78/99/85789959ee31a7df60f4f6eb9ea59d55.jpg",
                width: 400,
              ),
              Image.asset("assets/images/imagemgatinho.jpg", width: 400),
              Text(
                "Seja bem vindo usuário querido",
              ), //Este é o texto com a fonte baixada
              Text("Este site é voltado para gateiros"),
              Text(
                "Clique aqui para ter uma sorpresa:",
                style:
                    GoogleFonts.oswald(), //Caso queira mudar a fonte padrão em uma parte específica do código
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tela2()),
                  );
                },
                child: Icon(Icons.arrow_forward_rounded),
              ),

              //Fontes sendo passadas em cada um dos trexhos de texto unitariamente
              // Text(
              //   "Este é o texto com a fonte baixada",
              //   style: TextStyle(
              //     fontFamily: "Montserrat",
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // Text(
              //   "Este é o texto com biblioteca",
              //   style: GoogleFonts.roboto(),
              // ),
              // Text(
              //   "Texto com biblioteca porém outra fonte",
              //   style: GoogleFonts.poppins(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
