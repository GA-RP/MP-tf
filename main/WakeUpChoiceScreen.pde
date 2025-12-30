//class WakeUpChoiceScreen que implementa a interface Screen
class WakeUpChoiceScreen implements Screen {

  PImage bg;

  float bx, by, bw, bh, spacing;
  String[] labels = { "Outfit 1", "Outfit 2", "Outfit 3" };

  WakeUpChoiceScreen(PImage frame) {
    this.bg = frame;

    bw = width * 0.22;
    bh = 56;

    by = height * 0.72;
    bx = width * 0.5;
    spacing = bw + 24;
  }

  public void update() {
  }

  public void display() {
    background(0);

    // frame fullscreen
    image(bg, 0, 0, width, height);

    textAlign(CENTER, CENTER);
    textSize(min(width, height) * 0.032);

    // desenhar 3 botões
    for (int i = 0; i < 3; i++) {

      // i=1 fica no centro, 0 à esquerda, 2 à direita
      float x = bx + (i - 1) * spacing;
      float y = by;

      boolean hover = isInside(mouseX, mouseY, x, y, bw, bh);

      noStroke();

      if (hover) {
        fill(0, 190);
      } else {
        fill(0, 150);
      }

      rectMode(CENTER);
      rect(x, y, bw, bh, 14);

      fill(255);
      text(labels[i], x, y);
    }
  }

  public void handleMousePressed() {
    // clicar nos botões
    for (int i = 0; i < 3; i++) {
      float x = bx + (i - 1) * spacing;
      float y = by;

      if (isInside(mouseX, mouseY, x, y, bw, bh)) {

        if (i == 0) currentScreen = new Outfit1Screen(videos[1]);
        if (i == 1) currentScreen = new Outfit2Screen(videos[2]);
        if (i == 2) currentScreen = new Outfit3Screen(videos[3]);

        println("Choice:", labels[i]); // verificar se o botão escolhe a opção correta
        break;
      }
    }
  }

  boolean isInside(float mx, float my, float cx, float cy, float w, float h) {
    if (mx < cx - w/2) return false;
    if (mx > cx + w/2) return false;
    if (my < cy - h/2) return false;
    if (my > cy + h/2) return false;
    return true;
  }
}
