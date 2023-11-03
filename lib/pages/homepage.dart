import 'package:calculadoradeimcsimples/utils/textbuttonemodificado.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina Inicial"),
      ),
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: const [
              Text(
                "\n Opcoes Disponiveis",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Divider(thickness: 4, height: 30, color: Colors.black),
              TextButtoneModificado(texto: "Calculadora de IMC"),
              TextButtoneModificado(texto: "Sobre"),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 122, 235, 255),
      body: SizedBox(
        width: double.infinity,
        height: 1000,
        child: Image.network(
            "https://ichef.bbci.co.uk/news/640/cpsprodpb/15E02/production/_104620698_prmo_imc_br-nc.png"),
      ),
    );
  }
}
