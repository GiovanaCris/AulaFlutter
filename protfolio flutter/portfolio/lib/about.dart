import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MaterialApp(home: Tela2()));
}

class Tela2 extends StatefulWidget {
  const Tela2({super.key});

  @override
  State<Tela2> createState() => _Tela2State();
}

class _Tela2State extends State<Tela2> {
  // Função para abrir links no navegador
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Não foi possível abrir o link')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao tentar abrir o link: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E8FF),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 153, 75, 255),
        title: const Text(
          "Welcome to my world",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
        child: Column(
          children: [
            Image.asset('assets/images/Group 4.png', width: 800),
            const SizedBox(height: 20),

            // Who I am
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Text(
                "Who i am?",
                style: GoogleFonts.jomolhari(fontSize: 25),
              ),
            ),

            // Sobre você
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3E8FF),
                  border: Border.all(
                    color: const Color(0xFFBEA0E3),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "My name is Giovana Cristina, I'm 18 years old and currently in my third year of high school. I'm living one of my dreams by working at Robert Bosch. Since I started there, I've been on a journey full of learning, I've been a developer for 1 year and I've had the opportunity to experience truly unique moments. A little more about me: I love music and singing – that are a big part of who I am.",
                  style: GoogleFonts.jomolhari(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),

            // Projects
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Projects",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.jomolhari(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Projeto 1
                  GestureDetector(
                    onTap: () {
                      _launchURL(
                        'https://www.canva.com/design/DAGsOIm5brE/XmCFhYtzuiluifjivcfQyw/edit?utm_content=DAGsOIm5brE&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton',
                      );
                    },
                    child: Text(
                      "EZBOOK: Gerenciamento de salas de reunião",
                      style: GoogleFonts.jomolhari(
                        fontSize: 18,
                        color: const Color.fromARGB(255, 155, 68, 255),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Projeto 2
                  GestureDetector(
                    onTap: () {
                      _launchURL(
                        'https://www.canva.com/design/DAGoGXLZAzE/Z1KDDMBCsZkPagyE8U-GGg/edit?utm_content=DAGoGXLZAzE&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton',
                      );
                    },
                    child: Text(
                      "Safety Track: DDS, BAST, AMA",
                      style: GoogleFonts.jomolhari(
                        fontSize: 18,
                        color: const Color.fromARGB(255, 155, 68, 255),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Projeto 3
                  GestureDetector(
                    onTap: () {
                      _launchURL(
                        'https://www.canva.com/design/DAGfpOY7yc4/KzuCxBt4KqGOKKX2ip8KsQ/edit?utm_content=DAGfpOY7yc4&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton',
                      );
                    },
                    child: Text(
                      "MedFlow: Solicitação de receitas médicas",
                      style: GoogleFonts.jomolhari(
                        fontSize: 18,
                        color: const Color.fromARGB(255, 155, 68, 255),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Botão das ferramentas
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("My Tools"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/Ferramentas.png',
                            width: 450,
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Close"),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBEA0E3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
                child: Text(
                  "Click here to see my tools",
                  style: GoogleFonts.jomolhari(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
