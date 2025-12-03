//class WakeUpScreen que implementa a interface Screen
class WakeUpScreen implements Screen {

  Movie wake_up;

  WakeUpScreen(Movie wake_up) {
    this.wake_up = wake_up;
    wake_up.loop();  // ou video.play()
  }

  public void update() {
  }

  public void display() {
    background(0);

    // fullscreen com proporção
    float vw = wake_up.width;
    float vh = wake_up.height;

    float scaleW = width / vw;
    float scaleH = height / vh;
    float scaleFinal = max(scaleW, scaleH);

    float drawW = vw * scaleFinal;
    float drawH = vh * scaleFinal;

    float x = (width - drawW) / 2;
    float y = (height - drawH) / 2;

    image(wake_up, x, y, drawW, drawH);
  }

  public void handleMousePressed() {
  }
}
