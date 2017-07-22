var Size = 400;
var Vx = 0;
var Vy = 0;
var Vr = 0;
var Vc = false;
void setup(){
  size(Size,Size);
}
mouseClicked = function(){
  if(mouseY>240*400/Size&&floor((mouseX*400/Size)/80)+(mouseY*400/Size>320?6:1)===V1+V2){
    V1 = floor(random(0,10));
    V2 = floor(random(V1+1,11))-V1;
    Vc=true; Vr=1; Vx=mouseX*400/Size; Vy=mouseY*400/Size;
  }else{Vc=false; Vr=1; Vx=mouseX*400/Size; Vy=mouseY*400/Size;}
}
var V1 = floor(random(0,10));
var V2 = floor(random(V1+1,11))-V1;
var VT = 1;
draw = function(){
  background(0,0,0);
  textAlign(CENTER);
  noStroke();
  pushMatrix();
  scale(Size/400,Size/400);
  fill(255,255,255);
  rect(150,110,100,30);
  rect(185,75,30,100);
  textSize(150);
  text(V1,75,175);
  text(V2,325,175);
  stroke(255,255,255);
  strokeWeight(3);
  line(0,240,400,240);
  line(0,320,400,320);
  line(0,242,0,400);
  line(80,242,80,400);
  line(160,242,160,400);
  line(240,242,240,400);
  line(320,242,320,400);
  line(400,242,400,400);
  line(0,400,400,400);
  textSize(50);
  text(1,40,295);
  text(2,120,295);
  text(3,200,295);
  text(4,280,295);
  text(5,360,295);
  text(6,40,375);
  text(7,120,375);
  text(8,200,375);
  text(9,280,375);
  text(10,360,375);
  if(Vc===false){stroke(255,0,0,300-Vr*5);}else{stroke(0,255,0,300-Vr*5);}
  strokeWeight(10);
  noFill();
  ellipse(Vx,Vy,Vr,Vr);
  if(Vr!==0){Vr+=3;}
  if(Vr>60){Vr=0;}
  popMatrix();
};
