import 'package:flutter/material.dart';

void main() {
  runApp(const Contador()); //Roda a aplicação
}

// para fazer isso (st: statefull)
class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  //Codar em DART aqui
  int _numero = 0;

  void aumentar() {
    setState(() {
      //Função que atualiza o valor da variável (deixa a tela dinâmica)
      _numero++;
    });
  }

  void diminuir() {
    setState(() {
      if (_numero > 0) {
        _numero = _numero - 1;
      } else {
        _numero = 0;
      }
    });
  }

  void resetar() {
    setState(() {
      _numero = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Quem fornece componentes
      home: Scaffold(
        //Divide a tela entre appbar e body
        appBar: AppBar(
          title: Text(
            "Contador da Gi",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
          ),
          centerTitle: true, //Deixa o título no meio
          backgroundColor: const Color.fromARGB(255, 233, 225, 255),

          // toolbarHeight: 200, //Aumentar o tamanho da appbar
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //Elementos um abaixo do outro
          children: [
            //Vários elementos filhinhos
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJNYqe13Y3M3ch70xAI6peV4bO3vg6baN3B92EtOf9y16gpJjfMnsxg4jtpp5onqUHcBc&usqp=CAU", //imagem da Web
            ),
            Text("$_numero", style: TextStyle(fontSize: 80)),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Colocar a linha no centro
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 30,
                    ), //altura e largura do botão
                    backgroundColor: const Color.fromARGB(
                      255,
                      210,
                      183,
                      255,
                    ), //Cor de fundo
                    foregroundColor: Colors.white, //Cor do ícone
                  ),
                  onPressed: () {
                    aumentar();
                  },
                  child: Icon(Icons.add),
                ), //OnPressed: Onclick, Child: conteúdo dentro do botão

                SizedBox(width: 20), //dar espaço no botão

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                    backgroundColor: const Color.fromARGB(255, 210, 183, 255),
                    foregroundColor: Colors.white, //Cor do ícone
                  ),
                  onPressed: () {
                    diminuir();
                  },
                  child: Icon(Icons.remove),
                ),

                SizedBox(width: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                    backgroundColor: const Color.fromARGB(255, 210, 183, 255),
                    foregroundColor: Colors.white, //Cor do ícone
                  ),
                  onPressed: () {
                    resetar();
                  },
                  child: Icon(Icons.restore),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
