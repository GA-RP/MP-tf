// qualquer class que implemente Screen é obrigada a ter os seguintes métodos.
// apenas declara o código, não contêm código
interface Screen {

  //update() para atualizar a lógica do ecrã atual
  void update();

  //display() para desenhar o ecrã, parte visual
  void display();

  //handleMousePressed() trata do mouseClick no ecrã atual, para cada ecrã poder reagir de forma diferente
  void handleMousePressed();
}


//ORGANIZAÇÃO

//main
//BootScreen (AlarmSound)
//WakeUpScreen (video1)
//WakeUpChoiceScreen (frame1)

//Outfit1Screen (video2)
//O1Choice1Screen (frame2)
//O1_1Screen (video3)
//O1_2Screen (video4)
//O1Choice2Screen (frame3)
//O1_3Screen (video5)
//O1_4Screen (video6)

//Outfit2Screen (video12) - returns to WakeUpChoiceScreen (frame1)

//Outfit3Screen (video7)
//O3Choice1Screen (frame4)
//O3_1Screen (video8)
//O3_2Screen (video9)
//O3Choice2Screen (frame5)
//O3_3Screen (video10)
//O3_4Screen (video11)

//FinalGood (video13)

//FinalBad (video14)

//---------------------------------

//EQUIPA

//GUILHERME ANDRADE - A045395

//RODRIGO PEDRA - A042419

//--------------------------------

//A FALTAR

//adicionar os créditos a seguir aos FinalGood e FinalBad
