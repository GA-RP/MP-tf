//class DesktopScreen que implementa a interface Screen
class DesktopScreen implements Screen {
  PImage desktopBg;

  DesktopScreen() {

    // carrega a imagem relativa ao desktop background
    desktopBg = loadImage("desktop_bg.jpg");
  }

  public void update() {
  }

  public void display() {
    if (desktopBg != null) {
      // a img ocupa o fullscreen
      image(desktopBg, 0, 0, width, height);
    } else {
      //se a img falhar, cor de reserva
      background(40, 80, 140);
    }
  }

  public void handleMousePressed() {
  }
}
