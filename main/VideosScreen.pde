//class VideosScreen que implementa a interface Screen
class VideosScreen implements Screen {

  Movie video;  //variável do vídeo a ser reproduzido neste ecrã
  Screen nextScreen;  // variavel do ecrã para onde navegar a seguir
  boolean started = false;  // estado do vídeo (se começou ou não)
  boolean finished = false;  // estado do vídeo (se terminou ou não)

  VideosScreen(Movie video, Screen nextScreen) { //construtor recebe o vídeo a reproduzir e o ecrâ atual
    this.video = video;  //guarda a referência ao vídeo
    this.nextScreen = nextScreen;  //guarda o ecrã seguinte
  }

  //garantir que o video apenas roda 1x
  void startVideoOnce() {
    if (started) return;  //se o video começou, não faz nada
    started = true;  //marca o video como iniciado

    video.play();  //inicia a reprodução
  }
  
  public void update() {
    startVideoOnce();

    //verifica se o vídeo já terminou
    //duration() -> duração total do vídeo
    //time() -> tempo atual de reprodução
    if (!finished && video.duration() > 0 && video.time() >= video.duration() - 0.05) {
      finished = true;  //marca o estado do vídeo como terminado
      video.stop();  //para a reprodução do vídeo

      currentScreen = nextScreen;  //passa para o ecrã seguinte
    }
  }

  public void display() {
    background(0);  //ecrã com fundo preto

    float vw = video.width;  //dimensões originais do vídeo, largura
    float vh = video.height;  //dimensões originais do vídeo, altura

    if (vw <= 0 || vh <= 0) return;  //evita desenhar enquanto o vídeo não carregou

    //escala para o vídeo ocupar o ecrã todo e manter proporção (usado como salvaguarda no caso de usar fullscreen num ecrã não convencional)
    float scaleW = width / vw;  //escala necessária para preencher o ecrã na horizontal
    float scaleH = height / vh;  //escala necessária para preencher o ecrã na vertical
    float scaleFinal = max(scaleW, scaleH); //escolhe a maior escala para ocupar o ecrã todo mantendo a proporção

    //dimensões finais do vídeo no ecrã
    float drawW = vw * scaleFinal;  //largura final do vídeo no canvas (com a escala aplicada)
    float drawH = vh * scaleFinal;  //altura final do vídeo no canvas (com a escala aplicada)

    //calcula a posição para centrar o vídeo
    float x = (width - drawW) / 2;  //posição x do vídeo
    float y = (height - drawH) / 2;  //posição y do vídeo

    image(video, x, y, drawW, drawH);  //desenha o vídeo no ecrã
  }

  public void handleMousePressed() {
    //não faz nada neste ecrã
  }
}
