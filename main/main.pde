import processing.sound.*;   // importar biblioteca do processing "sound"

Screen currentScreen;
SoundFile bootSound;

void setup() {
  // fullScreen();  // adaptar ao tamanho do próprio monitor
  size(1280, 720); // tamanho temporário
  // ficheiro de áudio pc_boot relativo ao boot do first screen
  bootSound = new SoundFile(this, "pc_boot.mp3");
  currentScreen = new BootScreen(bootSound);
}

void draw() {
  currentScreen.update();
  currentScreen.display();
}

void mousePressed() {
  currentScreen.handleMousePressed();
}
