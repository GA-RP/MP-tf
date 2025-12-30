//videoFiles é usada no reset para recriar os objetos Movie, isto resolve um problema da biblioteca de vídeo do Processing (ao parar o vídeo, o programa pode perder o estado do mesmo)
//por isso ao recriar os Movie garantimos que: os vídeos voltam ao início, a ordem dos vídeos é sempre a mesma
String[] videoFiles = { "video1.mp4", "video2.mp4", "video3.mp4", "video4.mp4" };  //lista com os nomes dos ficheiros de vídeo usados no projeto

void resetProject() {

  //verifica se o alarmSound existe e se está a tocar
  if (alarmSound != null && alarmSound.isPlaying()) {
    alarmSound.stop();  //para o som alarmSound
  }

  //ciclo para passar por todos os vídeos do array videos[]
  for (int i = 0; i < videos.length; i++) {
    if (videos[i] != null) {  //confirmar que existe um Movie na posição do array [i]
      videos[i].stop();  //para o vídeo atual [i]
    }
  }

  //ciclo para recriar todos os objetos Movie (reset da biblioteca de vídeo)
  for (int i = 0; i < videos.length; i++) {
    videos[i] = new Movie(this, videoFiles[i]);  //cria novamente o Movie (usando o videoFile)
  }
  
  currentScreen = new BootScreen(alarmSound);  //volta ao ecrã inicial do projeto
} //c
