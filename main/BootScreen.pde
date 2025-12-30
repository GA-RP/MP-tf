//class BootScreen que implementa a interface Screen
//este ecrã representa o estado inicial do projeto
class BootScreen implements Screen {

  SoundFile alarmSound;  //variável que guarda o som do alarmSound
  
  boolean bootStarted = false;  //indica se o processo de "acordar" começou
  float fontSize = min(width, height) * 0.06;  //tamanho do texto relativo ao ecrã
  
  int step = 0;  //variável do progresso dos steps
  
  float ox, oy;  //coordenadas X e Y do texto interativo

  //construtor do BootScreen
  BootScreen(SoundFile alarmSound) {
    this.alarmSound = alarmSound; //associa o som recebido à variável local
    randomizeOptionPos(); //randomize a posição inicial para o texto
  }

  public void update() {
    //verifica se o boot já começou e se o som do despertador terminou
    if (bootStarted && !alarmSound.isPlaying()) {
      currentScreen = new WakeUpScreen(videos[0]); //quando o alarmSound acaba, passa para o ecrã seguinte (WakeUpScreen)
    }
  }

  public void display() {
    background(16, 17, 17);  //fundo do ecrâ

    //efeito visual no mouse (spotlight)
    noStroke();  //sem contorno
    fill(255, 255, 255, 28);  //branco com baixa opacidade
    ellipse(mouseX, mouseY, 100, 100);  //círculo centrado no rato

    textAlign(CENTER, CENTER);  //texto centrado horizontal e verticalmente
    
    String optionText = getOptionText();  //obtém o texto a mostrar, através do step atual

    float radius = 240;  //raio da área de descoberta do texto
    float a = alphaByDistance(mouseX, mouseY, ox, oy, radius);  //opacidade do texto com base distância do mouse, 0..255

    fill(255, a); //define a cor do texto com a opacidade variável

    textSize(fontSize * 0.75);  //define o tamanho do texto
    text(optionText, ox, oy);  //desenha o texto na posição aleatória

    //hint
    fill(255);  //cor do texto da hint
    textSize(fontSize * 0.30);  //tamanho do texto (mais pequeno)
    if (!bootStarted) {  //está visível enquanto o boot n começa
      text("move mouse to explore (use 'R' to reset the experience)", width / 2, height * 0.95);  //texto da hint, centrado na parte inferior do ecrã
    }
  }

  public void handleMousePressed() {
    if (bootStarted) return;  //se o alarme já começou, ignorar os clicks do mouse

    //só permite a interação se o mouse estiver perto do texto
    float radius = 240;  //raio de interação
    float d = dist(mouseX, mouseY, ox, oy);  //dist do mouse ao texto
    if (d > radius) return;  //se estiver longe, não faz nada

    //progressão step by step
    if (step < 2) {  //enquanto não chegar ao último step
      step++;  //avança para o próximo step
      randomizeOptionPos();  //gera uma nova posição aleatória para o texto
    } else {
      //último step: iniciar o processo de boot
      bootStarted = true;  //marca o boot como iniciado
      alarmSound.play();  //toca o som do despertador uma vez
    }
  }
  
  //devolve o texto correspondente ao step atual
  String getOptionText() {
    if (step == 0) return "wake up";  //primeiro estado
    if (step == 1) return "wake UP";  //segundo estado
    return "WAKE UP";  //estado final
  }

  //gera uma posição aleatória segura para o texto (dentro de uma margem do canva)
  void randomizeOptionPos() {
    //margens para evitar que o texto fique demasiado perto das bordas
    float marginX = width * 0.18; //margem horizontal
    float marginY = height * 0.18; //margem vertical

    ox = random(marginX, width - marginX); //posição X aleatória dentro da margem "horizontal"
    oy = random(marginY, height - marginY); //posição Y aleatória dentro da margem "vertical"

    oy = constrain(oy, marginY, height * 0.82);  //ajuste (evitar sobreposição com o texto da hint)
  }

  //calcular opacidade do texto com base na distância do mouse
  float alphaByDistance(float mx, float my, float x, float y, float radius) {
    float d = dist(mx, my, x, y);  //distância do mouse ao texto
    float t = 1.0 - constrain(d / radius, 0, 1);  //normaliza o valor entre 0 e 1 (o texto não ganha opacidade gradualmente fora da área do radius)
    return 5 + t * 250;  //longe quase invisível, perto praticamente visível
  }
}  //c
