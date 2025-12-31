// class Button constrói os botões usados na narrativa
class Button {

  float x, y;  //posição do botão (centro)
  float w, h;  //largura e altura do botão
  String label;  // texto do botão

  Button(float x, float y, float w, float h, String label) {  //construtor
    this.x = x; // guarda a posX do botão
    this.y = y; // guarda a posY do botão
    this.w = w; // guarda a largura do botão
    this.h = h; // guarda a altura do botão
    this.label = label;  // guarda o texto do botão
  }

  void display() {

    boolean hover = isInside(mouseX, mouseY);  // verifica se o mouse está dentro do botão

    noStroke();  //remove o contorno do retângulo

    if (hover) {  //if o mouse estiver em cima do botão
      fill(0, 190);  //botão mais visível
    } else {  //senão
      fill(0, 150);  // botão menos visível
    }

    rectMode(CENTER);  //retângulo usa o centro como referência
    rect(x, y, w, h, 14);  // desenha o botão (com cantos arredondados)

    fill(255);  //cor do texto
    textAlign(CENTER, CENTER);  //texto centrado
    text(label, x, y);  //escreve/desenha o texto
  }

  // verifica se o mouse(mx, my) está dentro do botão
  boolean isInside(float mx, float my) {
    if (mx < x - w/2) return false;  // if estiver à esquerda do botão, é falso
    if (mx > x + w/2) return false;  // if estiver à direita do botão, é falso
    if (my < y - h/2) return false;  // if estiver acima do botão, é falso
    if (my > y + h/2) return false;  // if estiver abaixo do botão, é falso
    return true;  // se passar todas as condições, está dentro do botão
  }

  // verifica se o botão foi clicado (usando a posição do mouse)
  boolean isClicked() {
    return isInside(mouseX, mouseY);  // devolve true se o mouse estiver dentro do botão
  }
}  //c
