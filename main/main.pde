import processing.sound.*;   // importar biblioteca do processing "sound"
import processing.video.*;   // importar biblioteca do processing "video"

Screen currentScreen; // váriavel que visa guardar o ecrã atual
SoundFile alarmSound; // váriavel do som de despertador usado no BootScreen

// array de frames e vídeos a ser carregados
PImage[] frames = new PImage[4];  // guarda as 4 imagens (frames) usadas como fundo nos ecrãs de escolha
Movie[] videos = new Movie[4];    // guarda os 4 vídeos usados nas cenas

void setup() {
  // fullScreen();  // adaptar ao tamanho do próprio monitor
  size(1280, 720); // tamanho temporário
  alarmSound = new SoundFile(this, "alarm_clock.mp3"); // ficheiro de áudio alarm_clock relativo ao alarm do first screen

  // carregar frames respetivos ao array, todos dentro da pasta data/
  frames[0] = loadImage("frame1.png"); // carrega o frame 1
  frames[1] = loadImage("frame2.png"); // carrega o frame 2
  frames[2] = loadImage("frame3.png"); // carrega o frame 3
  frames[3] = loadImage("frame4.png"); // carrega o frame 4

  // carregar vídeos respetivos ao array, todos dentro da pasta data/
  videos[0] = new Movie(this, "video1.mp4"); // carrega o vídeo 1
  videos[1] = new Movie(this, "video2.mp4"); // carrega o vídeo 2
  videos[2] = new Movie(this, "video3.mp4"); // carrega o vídeo 3
  videos[3] = new Movie(this, "video4.mp4"); // carrega o vídeo 4

  currentScreen = new BootScreen(alarmSound); // define o primeiro ecrã do projeto (estado inicial = BootScreen)
}

void movieEvent(Movie m) {   // biblioteca de vídeo (sempre que há novo frame)
  m.read();                  // lê o próximo frame do vídeo para poder desenhar no ecrã
}

void draw() {
  currentScreen.update();    // atualiza a lógica do ecrã atual através da screen interface
  currentScreen.display();   // desenha o ecrã atual através da screen interface
}

void mousePressed() {        // evento de click do mouse
  currentScreen.handleMousePressed(); // atualiza a lógica do mouse click dependendo do ecrã, através da screen interface
}

void keyPressed() {          // evento de tecla pressionada
  if (key == 'r' || key == 'R') { // se o utilizador carregar em R
    resetProject();          // faz reset e volta ao início do projeto, através da class resetProject
  }
}
