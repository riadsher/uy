class Menu {

  PFont Title; // teh font
  String selected="game"; // what the selecter always starts on
  int select =0; // what level we are in selection
  String selection[] = {"game", "score", "exit"};
  boolean Score = false;


  Menu() {
    Title = loadFont("Stencil-100.vlw");
  }

  void DrawScorePanel() {
    textFont(Title, 50);
    fill(255);
    text("Level: "+level+" Score: "+score, width/2, 50);
  }

  void NextLevel() {

    textFont(Title, 50);
    fill(255, 255, 153);
    text("Flying to\nnext sector", width/2, height/2);
  }


  void DrawMenu() {
    if (Score) {
      DrawScore();
    } else {
      textFont(Title, 100);
      fill(255);
      textAlign(CENTER);
      char t = 187;
      text("ASTERIOD\n\n", width/2, 150);

      textFont(Title, 70);
      if (selected.equals("game")) {
        text(""+t+"New Game", width/2-30, 300);
      } else {
        text(" New Game", width/2-30, 300);
      }
      if (selected.equals("score")) {
        text(""+t+"High Score", width/2, 370);
      } else {
        text(" High Score", width/2, 370);
      }
      if (selected.equals("exit")) {
        text(""+t+"Exit", width/2-130, 440);
      } else {
        text(" Exit", width/2-130, 440);
      }
    }
  }

  // never did get tot this meathod envolves build files and so on so was not that interested in it
  void DrawScore() {
  }

  void PlayerDead() {
    //background(255);
    textFont(Title, 50);
    fill(255, 255, 153);
    text("You Are Dead\nHit N for\na new Game.", width/2, height/2);
  }
  // move the selecter down the menu
  void down() {
    select++;
    selected=selection[select%3]; // teh limit if you will so that it doesn't go beyound
  }
  //move the selecter up the menu
  void up() {
    select--; 
    if (select<0)select=2;

    selected=selection[select%3];
  }
}