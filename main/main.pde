import processing.sound.*;   // importar biblioteca do processing "sound"
import processing.video.*;   // importar biblioteca do processing "video"

Screen currentScreen;
SoundFile alarmSound;
Movie wake_up;

void setup() {
  // fullScreen();  // adaptar ao tamanho do próprio monitor
  size(1280, 720); // tamanho temporário
  // ficheiro de áudio alarm_clock relativo ao alarm do first screen
  alarmSound = new SoundFile(this, "alarm_clock.mp3");
  wake_up = new Movie(this, "bike_trail.mp4");
  currentScreen = new BootScreen(alarmSound);
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  currentScreen.update();
  currentScreen.display();
}

void mousePressed() {
  currentScreen.handleMousePressed();
}
