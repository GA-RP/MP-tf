//class Outfit1Screen que implementa a interface Screen
class Outfit1Screen implements Screen {

  Movie video;
  boolean finished = false;

  Outfit1Screen(Movie video) {
    this.video = video;
    video.play();
  }

  public void update() {
    // ao acabar -> passa para o ecrã seguinte
    if (!finished && video.duration() > 0 && video.time() >= video.duration() - 0.05) {
      finished = true;
      video.stop();

      // usa o frame, carregado na main
      currentScreen = new WakeUpChoiceScreen(frames[1]);
    }
  }

  public void display() {
    background(0);

    // fullscreen com proporção
    float vw = video.width;
    float vh = video.height;

    // evita dividir por zero antes do vídeo carregar
    if (vw <= 0 || vh <= 0) return;

    float scaleW = width / vw;
    float scaleH = height / vh;
    float scaleFinal = max(scaleW, scaleH);

    float drawW = vw * scaleFinal;
    float drawH = vh * scaleFinal;

    float x = (width - drawW) / 2;
    float y = (height - drawH) / 2;

    image(video, x, y, drawW, drawH);
  }

  public void handleMousePressed() {
  }
}
