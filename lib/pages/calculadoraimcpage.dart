import 'package:calculadoradeimcsimples/Repository/historicodados.dart';
import 'package:flutter/material.dart';
import 'package:calculadoradeimcsimples/utils/calculadoraimcconta.dart';

var pesoController = TextEditingController();
var alturaController = TextEditingController();
HistoricoDados historicoDados = HistoricoDados();
List conjunto = [0.0, "a", Colors.brown];

class CalculadoraIMCPage extends StatefulWidget {
  const CalculadoraIMCPage({super.key});

  @override
  State<CalculadoraIMCPage> createState() => _CalculadoraIMCPageState();
}

class _CalculadoraIMCPageState extends State<CalculadoraIMCPage> {
  @override
  void dispose() {
    // TODO: implement dispose
    //falta fazer os ajustes aqui :)
    super.dispose();
  }

  void atualizarConjunto(double imc, String classificacao, Color cor) {
    setState(() {
      conjunto[0] = imc;
      conjunto[1] = classificacao;
      conjunto[2] = cor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            var peso = double.tryParse(pesoController.text);
            var altura = double.tryParse(alturaController.text);

            if (peso != null && altura != null) {
              List resultado =
                  CalculadoraIMCCOnta(peso, altura).calcularImc(peso, altura);

              double imc = resultado[0];
              String classificacao = resultado[1];
              Color cor = resultado[2];

              atualizarConjunto(imc, classificacao, cor);
              historicoDados.adicionarDados(conjunto[0]);

              alturaController.clear();
              pesoController.clear();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      "Algum dos dados informados está no formato incorreto, verifique novamente por favor, inclusive se está faltando preenchê-los.")));
            }
          }),
      body: Container(
        margin: const EdgeInsets.all(28),
        child: ListView(
          children: [
            const Card(
              elevation: 20,
              color: Color.fromARGB(255, 4, 50, 88),
              child: Text(
                "  IMC(Indice de Massa Corporal):\n   -imc<17=Muito Abaixo do Peso\n   -imc<18.5=Abaixo do Peso\n   -imc<25=Peso Normal\n   -imc<30=Acima do Peso\n   -imc<35=Obesidade 1\n   -imc<40=Obesidade 2(Severa)\n   -imc>40=Obesidade 3(morbida)",
                style: TextStyle(
                    fontSize: 24, color: Color.fromARGB(255, 235, 236, 241)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextFormField(
                  controller: pesoController,
                  decoration: const InputDecoration(
                      label: Text("Peso"), prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextFormField(
                  controller: alturaController,
                  decoration: const InputDecoration(
                      label: Text("Altura"), prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number),
            ),
            SizedBox(
              height: 230,
              child: Card(
                //falta so ajeitar o conjunto
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(16)),
                elevation: 20,
                color: conjunto[2],
                child: Text(
                  "\n Seu IMC é de: ${conjunto[0].toStringAsFixed(2)}\n\n Classificação: ${conjunto[1]}",
                  style: const TextStyle(fontSize: 27),
                ),
                //ai aqui eu puxo o IMC, classificacao e a cor indicativa do risco e problema
              ),
            ),
            Card(
              elevation: 18,
              child: Container(
                margin: EdgeInsets.all(16),
                height: 300,
                child: ListView.builder(
                    itemCount: historicoDados.listarDados().length,
                    itemBuilder: (context, index) {
                      return Text(
                        "IMC: ${historicoDados.listarDados()[index].toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
