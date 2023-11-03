import 'package:flutter/material.dart';

class CalculadoraIMCCOnta {
  CalculadoraIMCCOnta(double _peso, double _altura);

  List calcularImc(double _peso, double _altura) {
    double imc = _peso / (_altura * _altura); //imc
    List Conjunto = [];
    if (imc < 17) {
      String classificacao = "Muito Abaixo do Peso";
      Color cor = Colors.red;
      Conjunto.add(imc);
      Conjunto.add(classificacao);
      Conjunto.add(cor);
    } else if (imc < 18.5) {
      String classificacao = "Abaixo do Peso";
      Color cor = Colors.orange;
      Conjunto.add(imc);
      Conjunto.add(classificacao);
      Conjunto.add(cor);
    } else if (imc < 25) {
      String classificacao = "Peso Normal";
      Color cor = Colors.blue;
      Conjunto.add(imc);
      Conjunto.add(classificacao);
      Conjunto.add(cor);
    } else if (imc < 30) {
      String classificacao = "Acima do Peso";
      Color cor = Colors.yellow;
      Conjunto.add(imc);
      Conjunto.add(classificacao);
      Conjunto.add(cor);
    } else if (imc < 35) {
      String classificacao = "Obesidade 1";
      Color cor = Colors.orange;
      Conjunto.add(imc);
      Conjunto.add(classificacao);
      Conjunto.add(cor);
    } else if (imc < 40) {
      String classificacao = "Obesidade 2";
      Color cor = Colors.red;
      Conjunto.add(imc);
      Conjunto.add(classificacao);
      Conjunto.add(cor);
    } else {
      String classificacao = "Obesidade 3";
      Color cor = Color.fromARGB(255, 48, 18, 41);
      Conjunto.add(imc);
      Conjunto.add(classificacao);
      Conjunto.add(cor);
    }
    return Conjunto;
  }
}
