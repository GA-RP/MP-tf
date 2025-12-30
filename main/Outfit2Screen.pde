//class Outfit2Screen que implementa a interface Screen
class Outfit2Screen implements Screen {

  Movie video;  //variável do vídeo a ser reproduzido neste ecrã
  boolean finished = false;  //variável relativa ao estado do vídeo (se terminou ou não)

  Outfit2Screen(Movie video) {  //construtor recebe o vídeo a reproduzir
    this.video = video;  //guarda a referência ao vídeo
    video.play();  //inicia a reprodução do vídeo
  }

  public void update() {
    //verifica se o vídeo já terminou
    //duration() -> duração total do vídeo
    //time() -> tempo atual de reprodução
    if (!finished && video.duration() > 0 && video.time() >= video.duration() - 0.05) {
      finished = true;  //marca o estado do vídeo como terminado
      video.stop();  //para a reprodução do vídeo

      //passa para o ecrã seguinte
      currentScreen = new WakeUpChoiceScreen(frames[2]);  //usa o frame correspondente carregado na main
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
} //c
