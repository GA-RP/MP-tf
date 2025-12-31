import processing.sound.*;  //importar biblioteca do processing "sound"
import processing.video.*;  //importar biblioteca do processing "video"

Screen currentScreen; //váriavel que visa guardar o ecrã atual
SoundFile alarmSound; //váriavel do som de despertador usado no BootScreen

//array de frames e vídeos a ser carregados
PImage[] frames = new PImage[5];  //guarda as 5 imagens (frames) usadas como fundo nos ecrãs de escolha
Movie[] videos = new Movie[14];  //guarda os 14 vídeos usados nas cenas

void setup() {
  //fullScreen();  //adaptar ao tamanho do próprio monitor
  size(1280, 720); //tamanho temporário
  alarmSound = new SoundFile(this, "alarm_clock.mp3"); //ficheiro de áudio alarm_clock relativo ao alarm do first screen

  //carregar frames respetivos ao array, todos dentro da pasta data/
  frames[0] = loadImage("frame1.png"); //carrega o frame 1
  frames[1] = loadImage("frame2.png"); //carrega o frame 2
  frames[2] = loadImage("frame3.png"); //carrega o frame 3
  frames[3] = loadImage("frame4.png"); //carrega o frame 4
  frames[4] = loadImage("frame5.png"); //carrega o frame 5

  //carregar vídeos respetivos ao array, todos dentro da pasta data/
  videos[0] = new Movie(this, "video1.mp4"); //carrega o vídeo 1
  videos[1] = new Movie(this, "video2.mp4"); //carrega o vídeo 2
  videos[2] = new Movie(this, "video3.mp4"); //carrega o vídeo 3
  videos[3] = new Movie(this, "video4.mp4"); //carrega o vídeo 4
  videos[4] = new Movie(this, "video5.mp4"); //carrega o vídeo 5
  videos[5] = new Movie(this, "video6.mp4"); //carrega o vídeo 6
  videos[6] = new Movie(this, "video7.mp4"); //carrega o vídeo 7
  videos[7] = new Movie(this, "video8.mp4"); //carrega o vídeo 8
  videos[8] = new Movie(this, "video9.mp4"); //carrega o vídeo 9
  videos[9] = new Movie(this, "video10.mp4"); //carrega o vídeo 10
  videos[10] = new Movie(this, "video11.mp4"); //carrega o vídeo 11
  videos[11] = new Movie(this, "video12.mp4"); //carrega o vídeo 12
  videos[12] = new Movie(this, "video13.mp4"); //carrega o vídeo 13
  videos[13] = new Movie(this, "video14.mp4"); //carrega o vídeo 14

  currentScreen = new BootScreen(alarmSound); //define o primeiro ecrã do projeto (estado inicial = BootScreen)
}

void movieEvent(Movie m) {  //biblioteca de vídeo (sempre que há novo frame)
  m.read();  //lê o próximo frame do vídeo para poder desenhar no ecrã
}

void draw() {
  currentScreen.update();  //atualiza a lógica do ecrã atual através da screen interface
  currentScreen.display();  //desenha o ecrã atual através da screen interface
}

void mousePressed() {  //evento de click do mouse
  currentScreen.handleMousePressed(); //atualiza a lógica do mouse click dependendo do ecrã, através da screen interface
}

void keyPressed() {  //evento de tecla pressionada
  if (key == 'r' || key == 'R') {  //se o utilizador carregar em R
    resetProject();  //faz reset e volta ao início do projeto, através da class resetProject
  }
} //c
