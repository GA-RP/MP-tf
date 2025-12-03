//class BootScreen que implementa a interface Screen
class BootScreen implements Screen {

  SoundFile alarmSound;

  boolean bootStarted = false;
  // tamanho da fonte relativo ao ecrã
  float fontSize = min(width, height) * 0.06;

  BootScreen(SoundFile alarmSound) {

    this.alarmSound = alarmSound;
  }

  public void update() {
    // if comecçou o boot + o som terminou passar para o DesktopScreen
    if (bootStarted && !alarmSound.isPlaying()) {
    currentScreen = new WakeUpScreen(wake_up);
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

    text("WAKE UP", width / 2, height / 2);
  }

  public void handleMousePressed() {
    if (!bootStarted) {
      bootStarted = true;
      alarmSound.play();  // toca o som uma vez
    }
  }
}
