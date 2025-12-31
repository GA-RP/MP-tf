//class WakeUpChoiceScreen que implementa a interface Screen
class WakeUpChoiceScreen implements Screen {

  PImage bg;  //variável que guarda o frame
  Button[] buttons = new Button[3];  //array que guarda os 3 botões

  WakeUpChoiceScreen(PImage frame) {  //construtor, recebe o frame
    this.bg = frame;  //guarda o frame

    float bw = width * 0.22;  //largura de cada botão (adaptada a largura do canvas)
    float bh = 56;  //altura dos botões

    float by = height * 0.72; //posição Y (linha dos botões)
    float bx = width * 0.5;   //posição base X (centro)
    float spacing = bw + 24;  //spacing entre botões

    //criar os 3 botões
    buttons[0] = new Button(bx - spacing, by, bw, bh, "Roupa Casual");  // botão 1
    buttons[1] = new Button(bx, by, bw, bh, "Roupa de Desporto");  // botão 2
    buttons[2] = new Button(bx + spacing, by, bw, bh, "Roupa Formal");  // botão 3
  }

  public void update() {
    //não existe lógica por frame neste ecrã
  }

  public void display() {
    background(0);  //ecrã com fundo preto

    image(bg, 0, 0, width, height);  //desenha o frame a ocupar o canvas completo

    textSize(min(width, height) * 0.032);  //tamanho do texto (adaptando ao ecrã)

    //desenhar os 3 botões
    for (int i = 0; i < 3; i++) {
      buttons[i].display();  //desenha o botão i
    }
  }

  public void handleMousePressed() {

    //se clicar no botão 1
    if (buttons[0].isClicked()) {
      currentScreen = new Outfit1Screen(videos[1]);  // opção 1
    }

    //se clicar no botão 2
    if (buttons[1].isClicked()) {
      currentScreen = new Outfit2Screen(videos[11]);  // opção 2
    }

    //se clicar no botão 3
    if (buttons[2].isClicked()) {
      currentScreen = new Outfit3Screen(videos[6]);  // opção 3
    }
  }
}  //c
