class HistoricoDados {
  List<double> historico = [];
  HistoricoDados();

  void adicionarDados(double imc) {
    historico.add(imc);
  }

  List<double> listarDados() {
    return historico;
  }
}
