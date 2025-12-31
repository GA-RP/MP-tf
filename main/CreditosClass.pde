// class CreditosClass - lógica e desenho dos créditos
class CreditosClass {

  String[] lines;  //linhas do txt
  float posY;  //posição vertical inicial do texto
  float velocidade; // velocidade do movimento
  int espacamento;  //espaçamento entre linhas

  CreditosClass(String[] arquivo) {// construtor recebe o texto
    lines = arquivo;  // guarda as linhas do ficheiro
    posY = height;  // começa fora do ecrã (em baixo)
    velocidade = 1.5;  // velocidade de subida do texto
    espacamento = 40;  // distância entre linhas
  }

  // desenha o texto dos créditos
  void show() {
    fill(255);  // cor do texto  
    textSize(25);  // tamanho do texto
    textAlign(CENTER);  // texto centrado

    for (int i = 0; i < lines.length; i++) {  // ciclo para percorrer todas as linhas
      float posLine = posY + (i * espacamento); //calcula a posição de cada linha
      text(lines[i], width / 2, posLine);       //desenha a linha no ecrã
    }
  }

  //move os créditos (verticalmente)
  void move() {
    posY = posY - velocidade;  //desloca o texto para cima
  }
}  //c
