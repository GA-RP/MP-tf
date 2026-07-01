// class Creditos que implementa a interface Screen
class Creditos implements Screen {

  CreditosClass creditos;  //objeto responsável por desenhar e mover o texto
  String[] lines;  //linhas do txt

  Creditos() {//construtor

    lines = loadStrings("texto.txt");  //load o texto a partir do ficheiro
    creditos = new CreditosClass(lines);  //cria o objeto que trata da lógica dos créditos
  }

  public void update() {
    creditos.move();  //atualiza a posição do texto
  }

  public void display() {
    background(0);    //fundo preto
    creditos.show();  //desenha os créditos no ecrã
  }

  public void handleMousePressed() {
    // não faz nada neste ecrã
  }
}  //c
