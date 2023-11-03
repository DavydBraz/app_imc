import 'package:calculadoradeimcsimples/pages/calculadoraimcpage.dart';
import 'package:flutter/material.dart';

class TextButtoneModificado extends StatelessWidget {
  final String texto;
  const TextButtoneModificado({super.key, this.texto = ""});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        texto,
        style: const TextStyle(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.w400),
      ),
      onPressed: () {
        if (texto == "Calculadora de IMC") {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const CalculadoraIMCPage()));
        } else if (texto == "Sobre") {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text(
                  " O IMC (Índice de Massa Corporal) é um padrão internacional de cálculo da obesidade de um indivíduo adotado pela OMS (Organização Mundial da Saúde).\n O método, desenvolvido pelo belga Lambert Quételet no fim do século XIX, é a forma mais fácil de saber se uma pessoa está com o peso ideal ou não.\n  A altura (calculada em metros) e o peso (calculado em quilogramas) do indivíduo são os dois fatores levados em conta no cálculo do IMC. Para calcularmos o índice, basta dividirmos o peso de uma pessoa pela sua altura ao quadrado:\n IMC = Massa/Altura²"),
            ),
          );
        }
      },
    );
  }
}
