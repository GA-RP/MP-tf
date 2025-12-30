void resetProject() {
  // parar todos os vídeos
  for (int i = 0; i < videos.length; i++) {
    videos[i].stop();
  }

  // parar som (se estiver a tocar)
  if (alarmSound.isPlaying()) {
    alarmSound.stop();
  }

  // voltar ao início
  currentScreen = new BootScreen(alarmSound);
}
