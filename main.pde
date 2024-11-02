float size;
int n=1;
int m=0;
int theta = 60;
int z=0;
boolean flag=false;
String text;

void setup() {
  size(1000, 1000);
  size=(height)*5/6;
  stroke(0, 0, 0);
}

void draw() {
  background(255);
  noFill();
  float x=width/2;
  float y=height/2;
  n=n+m;
  theta+=z;
  uds(x, y-size/2, x-sqrt(3)*size/4, y+size/4, n);
  uds(x-sqrt(3)*size/4, y+size/4, x+sqrt(3)*size/4, y+size/4, n);
  uds(x+sqrt(3)*size/4, y+size/4, x, y-size/2, n);
  if (flag) {
    String name="koch_snowflake_angle="+theta+"_n="+n+".png";
    text="";
    saveFrame(name);
    flag=false;
  }
  text="angle = "+theta+"\nn = "+n;
  textSize(20);
  fill(0);
  text(text,20,20);
  m=0;
  z=0;
}

void uds(float x1, float y1, float x2, float y2, int iter) {
  float x4, y4, x5, y5, x6, y6, len, ang;
  int dir=(int)pow(-1, 1+n%2+iter%2);
  x4 = x1/3+x2*2/3;
  y4 = y1/3+y2*2/3;
  x5 = x1*2/3+x2/3;
  y5 = y1*2/3+y2/3;
  len = dist(x4, y4, x5, y5);
  ang = atan2(y5-y4, x5-x4);
  ang = ang + dir*(theta*PI/180);
  x6 = x4 + len * cos(ang);
  y6 = y4 + len * sin(ang);
  stroke(0,0,255);
  if (iter>1) {
    uds(x2, y2, x4, y4, iter-1);
    uds(x4, y4, x6, y6, iter-1);
    uds(x6, y6, x5, y5, iter-1);
    uds(x5, y5, x1, y1, iter-1);
  }
  else {
    line(x1,y1,x2,y2);
  }
}
void mouseClicked() {
  flag=true;
 }
 
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP && n<10) {
      m=1;
    }
    else if (keyCode == DOWN && n>1) {
      m=-1;
    }
    if (keyCode == RIGHT && theta<360) {
      z=1;
    }
    else if (keyCode == LEFT && theta>0) {
      z=-1;
    }
  }
}
