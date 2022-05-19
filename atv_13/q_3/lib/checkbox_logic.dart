class CheckboxLogic {
  bool b1 = false;
  bool b2 = false;
  bool b3 = false;
  bool b4 = false;

  void aceitarTodos() {
    if (b4) {
    b1 = true;
    b2 = true;
    b3 = true;

    } else {
    b1 = false;
    b2 = false;
    b3 = false;
    }
  }
  void tresPrimeiros(){
    if (b1 && b2 && b3){
      b4 = true;
    } if (!b1 || !b2 || !b3){
      b4 = false;
    }
  }
}
  