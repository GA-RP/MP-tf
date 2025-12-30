//class BootScreen que implementa a interface Screen
class BootScreen implements Screen {

  SoundFile alarmSound;

  boolean bootStarted = false;
  // tamanho da fonte relativo ao ecrã
  float fontSize = min(width, height) * 0.06;
  
  // int steps do progresso
  int step = 0;
  
  // posição da opção atual
  float ox, oy;

  BootScreen(SoundFile alarmSound) {
    this.alarmSound = alarmSound;
    randomizeOptionPos();
  }

  public void update() {
    // if comecçou o boot + o som terminou passar para o WakeUpScreen
    if (bootStarted && !alarmSound.isPlaying()) {
    currentScreen = new WakeUpScreen(videos[0]);
    }
  }

  public void display() {
    //fundo do ecrâ
    background(16, 17, 17);

    noStroke();
    fill(255, 255, 255, 28);
    ellipse(mouseX, mouseY, 100, 100);

    textAlign(CENTER, CENTER);

    // opção atual (by dist)
    String optionText = getOptionText();

    float radius = 240; // área de descoberta
    float a = alphaByDistance(mouseX, mouseY, ox, oy, radius); // 0..255

    fill(255, a);

    textSize(fontSize * 0.75);
    text(optionText, ox, oy);

    // hint
    fill(255);
    textSize(fontSize * 0.30);
    if (!bootStarted) {
      text("move mouse to explore (use 'R' to reset the experience)", width / 2, height * 0.95);
    }
  }

  public void handleMousePressed() {
    // se o alarme já começou, ignorar os clicks do mouse
    if (bootStarted) return;

    // só avançar se estiver perto da opção (text)
    float radius = 240;
    float d = dist(mouseX, mouseY, ox, oy);
    if (d > radius) return;

    // step by step
    if (step < 2) {
      step++;
      randomizeOptionPos();
    } else {
      // ultimo step: WAKE UP -> toca alarme
      bootStarted = true;
      alarmSound.play();  // toca o alarm uma vez
    }
  }
  
  // devolver o text pelo step
  String getOptionText() {
    if (step == 0) return "wake up";
    if (step == 1) return "wake UP";
    return "WAKE UP";
  }

  void randomizeOptionPos() {
    // texto maior, mais margin
    float marginX = width * 0.18;
    float marginY = height * 0.18;

    ox = random(marginX, width - marginX);
    oy = random(marginY, height - marginY);

    // margin, evitar aparecer perto do hint
    oy = constrain(oy, marginY, height * 0.82);
  }

  // opacidade by dist
  float alphaByDistance(float mx, float my, float x, float y, float radius) {
    float d = dist(mx, my, x, y);
    float t = 1.0 - constrain(d / radius, 0, 1); // 0..1
    return 5 + t * 250; // longe quase invisível, perto visível
  }
}
