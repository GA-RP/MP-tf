//class BootScreen que implementa a interface Screen
class BootScreen implements Screen {

  SoundFile bootSound;

  boolean bootStarted = false;
  // tamanho da fonte relativo ao ecrã
  float fontSize = min(width, height) * 0.06;

  BootScreen(SoundFile bootSound) {

    this.bootSound = bootSound;
  }

  public void update() {
    // if comecçou o boot + o som terminou passar para o DesktopScreen
    if (bootStarted && !bootSound.isPlaying()) {
      currentScreen = new DesktopScreen();
    }
  }

  public void display() {
    //fundo do ecrâ
    background(16, 17, 17);

    fill(255);
    // texto centrado no screen
    textAlign(CENTER, CENTER);
    // tamanho da fonte relativo ao ecrã
    textSize(fontSize);

    text("CLICK TO BOOT", width / 2, height / 2);
  }

  public void handleMousePressed() {
    if (!bootStarted) {
      bootStarted = true;
      bootSound.play();  // toca o som uma vez
    }
  }
}
