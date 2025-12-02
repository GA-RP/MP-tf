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
