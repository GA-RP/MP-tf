//class O1Choice1Screen que implementa a interface Screen
class O1Choice1Screen implements Screen {

  PImage bg;  //variável que guarda o frame
  Button[] buttons = new Button[2];  //array que guarda os 2 botões deste ecrã

  O1Choice1Screen(PImage frame) {  //construtor, recebe o frame
    this.bg = frame;  //guarda o frame

    float bw = width * 0.28;  // largura de cada botão (maior por existirem apenas 2)
    float bh = 56;  // altura de cada botão

    float by = height * 0.72; // posição Y (linha dos botões)
    float bx = width * 0.5;   // posição base X (centro)
    float spacing = bw + 24;  // spacing entre botões

    // criar os 2 botões (esquerda e direita do centro)
    buttons[0] = new Button(bx - spacing / 2, by, bw, bh, "Deixar Entrar");  // botão 1
    buttons[1] = new Button(bx + spacing / 2, by, bw, bh, "Entrar em Primeiro");  // botão 2
  }

  public void update() {
    // não existe lógica por frame neste ecrã
  }

  public void display() {
    background(0);  // ecrã com fundo preto

    image(bg, 0, 0, width, height);  // desenha o frame a ocupar o canvas completo

    textSize(min(width, height) * 0.032);  // definir o tamanho do texto (adaptando ao ecrã)

    //desenhar os 2 botões
    for (int i = 0; i < 2; i++) {
      buttons[i].display();  // desenha o botão i
    }
  }

  public void handleMousePressed() {

    //se clicar no botão 1
    if (buttons[0].isClicked()) {
      currentScreen = new VideosScreen(videos[2], new O1Choice2Screen(frames[2]));  // opção 1
    }

    //se clicar no botão 2
    if (buttons[1].isClicked()) {
      currentScreen = new VideosScreen(videos[3], new O1Choice2Screen(frames[2]));  // opção 2
    }
  }
} //c
