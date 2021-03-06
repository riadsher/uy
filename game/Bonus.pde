import java.awt.geom.Rectangle2D;
// so this just for teh bonus to keep it clean and not 
// have them littering on class file
class Bonus {
  // i had thoughts of making them expire but they go off the screen and 
  // it seemed pointless in the end
  int timeCreated;

  // state varibles to take not of state of the bonus.
  PVector loc;
  PVector speed = new PVector(0, 0);  
  float angle = 0;
  float mag =0.1;
  PFont font;


  char current; // this defines what type of bonus it is

  char type[] = new char[] {'A', 'W', 'D'}; // all possible types of bonus

  //constructer
  Bonus(PVector loc) {
    timeCreated=millis();
    this.loc = loc;
    font =  loadFont("Stencil-100.vlw");
    int bonus = Math.round(random(3))%3;
    current = type[bonus];
  }

  void Draw() {
    noFill();
    stroke(255);
    textFont(font, 23);
    textAlign(CENTER);
    strokeWeight(3);
    rect(loc.x-12, loc.y-12, 24, 24, 5);
    fill(255);
    text(current, loc.x, loc.y+8 );
  }

  //did the ship make contact with it
  boolean contact(ship p) {

    Rectangle2D.Float box = new Rectangle2D.Float(loc.x-12, loc.y-12, 24, 24);
    return p.Collison(new Polygon2D(box));
  }

  // basic meathods that i copied from ship 
  void move() {
    loc.x =(loc.x+speed.x);
    loc.y =(loc.y+speed.y);
  }

  // basic meathods that i copied from ship 
  void turn(float ang) {
    angle = ang;
    //speed = PVector.fromAngle(ang).mult(mag);
  }
  // basic meathods that i copied from ship 
  void chaSpeed(float spe) {
    mag = spe;
    speed = PVector.add(speed, PVector.fromAngle(angle).mult(mag));
  }
  //definds the bounds of the object
  boolean bounds() {
    if (loc.x>width || loc.x <0) return true;
    if (loc.y>height || loc.y <0 ) return true;
    return false;
  }
}