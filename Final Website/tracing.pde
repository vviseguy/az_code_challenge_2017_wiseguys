var Size = 700;
void setup(){
  size(Size,Size);
}
var Start = true;
var V1 = 0;
var V2 = 0;
var ParX = [0];
var ParY = [];
var ParV = [];
var ParR = [];
var Char = 10;
var RotG = 0;
var VA = [];
var VB = [];
mouseClicked = function(){
  if(Done===true){
    V2=0;
    VA=[];
    VB=[];
    V1=0;
    Char++;
    ParX=[random(20,380),random(20,380),random(20,380),random(20,380),random(20,380),random(20,380),random(20,380),random(20,380),random(20,380),random(20,380),random(20,380),random(20,380),random(20,380),random(20,380),random(20,380)];
    ParY=[random(-20,-300),random(-20,-300),random(-20,-300),random(-20,-300),random(-20,-300),random(-20,-300),random(-20,-300),random(-20,-300),random(-20,-300),random(-20,-300),random(-20,-300),random(-20,-300),random(-20,-300),random(-20,-300),random(-20,-300)];
    ParR=[random(1,90),random(1,90),random(1,90),random(1,90),random(1,90),random(1,90),random(1,90),random(1,90),random(1,90),random(1,90),random(1,90),random(1,90),random(1,90),random(1,90),random(1,90)];
    ParV=[random(3,5),random(3,5),random(3,5),random(3,5),random(3,5),random(3,5),random(3,5),random(3,5),random(3,5),random(3,5),random(3,5),random(3,5),random(3,5),random(3,5),random(3,5)];
    Done=false;
  }
};
var GameOver = function(A,B){
  noStroke();
  pushMatrix();
  scale(Size/400,Size/400);
  translate(200,200);
  rotate(sin(RotG));
  fill(255,255,0);
  ellipse(0,0,300,300);
  fill(0,0,0);
  ellipse(-50,-70,50,100);
  ellipse(50,-70,50,100);
  stroke(0,0,0);
  strokeWeight(15);
  noFill();
  arc(0,0,200,200,PI/8,PI*7/8);
  RotG+=0.05;
  popMatrix();
};
var Tra = function(A,B,V){
  fill(0,0,0,50);
  if(V1+1===V){
    fill(0,0,0,150);
    if(dist(mouseX*400/Size,mouseY*400/Size,A,B)<=20){
      V1++;
      VA.push(A);
      VB.push(B);
    }
    Done=false;
  }
  ellipse(A,B,40,40);
};
draw = function() {
  noStroke();
  Done=true;
    textSize(20);
    textAlign(CENTER);
    background(255,255,255);
    pushMatrix();
    scale(Size/400,Size/400);
    textSize(20);
    fill(0,0,0);
    text(Char>10?"":Char,20,25);
    if(Char===1){
      Tra(100,350,4);
      Tra(300,350,5);
      Tra(200,350,3);
      Tra(200,50,2);
      Tra(100,150,1);
    }
    if(Char===2){
      Tra(300,350,7);
      Tra(100,350,6);
      Tra(300,150,5);
      Tra(275,75,4);
      Tra(200,50,3);
      Tra(125,75,2);
      Tra(100,150,1);
    }
    if(Char===3){
      Tra(120,50,1);
      Tra(200,50,2);
      Tra(270,75,3);
      Tra(300,125,4);
      Tra(270,175,5);
      Tra(200,200,6);
      Tra(120,200,7);
      Tra(200,200,8);
      Tra(270,225,9);
      Tra(300,275,10);
      Tra(270,325,11);
      Tra(200,350,12);
      Tra(120,350,13);
    }
    if(Char===4){
      Tra(200,350,1);
      Tra(200,50,2);
      Tra(75,225,3);
      Tra(250,225,4);
    }
    if(Char===5){
      Tra(300,60,1);
      Tra(100,60,2);
      Tra(100,135,3);
      Tra(160,140,4);
      Tra(220,160,5);
      Tra(280,200,6);
      Tra(280,250,7);
      Tra(220,290,8);
      Tra(160,310,9);
      Tra(100,325,10);
    }
    if(Char===6){
      Tra(200+cos(6)*100,200+sin(6)*160,1);
      Tra(200+cos(5.5)*100,200+sin(5.5)*160,2);
      Tra(200+cos(5)*100,200+sin(5)*160,3);
      Tra(200+cos(4.5)*100,200+sin(4.5)*160,4);
      Tra(200+cos(4)*100,200+sin(4)*160,5);
      Tra(200+cos(3.5)*100,200+sin(3.5)*160,6);
      Tra(200+cos(3)*100,200+sin(3)*160,7);
      Tra(200+cos(2.5)*100,200+sin(2.5)*160,8);
      Tra(200+cos(2)*100,200+sin(2)*160,9);
      Tra(200+cos(1.5)*100,200+sin(1.5)*160,10);
      Tra(200+cos(1)*100,200+sin(1)*160,11);
      Tra(280,280,12);
      Tra(250,240,13);
      Tra(200,230,14);
      Tra(150,250,15);
      Tra(200+cos(2.5)*100,200+sin(2.5)*160,16);
    }
    if(Char===7){
      Tra(100,60,1);
      Tra(300,60,2);
      Tra(150,350,3);
    }
    if(Char===8){
      Tra(200,50,1);
      Tra(200-sqrt(2)*38,125-sqrt(2)*38,2);
      Tra(125,125,3);
      Tra(200-sqrt(2)*38,125+sqrt(2)*38,4);
      Tra(200,200,5);
      Tra(200+sqrt(2)*38,275-sqrt(2)*38,6);
      Tra(275,275,7);
      Tra(200+sqrt(2)*38,275+sqrt(2)*38,8);
      Tra(200,350,9);
      Tra(200-sqrt(2)*38,275+sqrt(2)*38,10);
      Tra(125,275,11);
      Tra(200-sqrt(2)*38,275-sqrt(2)*38,12);
      Tra(200,200,13);
      Tra(200+sqrt(2)*38,125+sqrt(2)*38,14);
      Tra(275,125,15);
      Tra(200+sqrt(2)*38,125-sqrt(2)*38,16);
      Tra(200,50,17);
    }
    if(Char===9){
      Tra(275,125,1);
      Tra(200+sqrt(2)*38,125-sqrt(2)*38,2);
      Tra(200,50,3);
      Tra(200-sqrt(2)*38,125-sqrt(2)*38,4);
      Tra(125,125,5);
      Tra(200-sqrt(2)*38,125+sqrt(2)*38,6);
      Tra(200,200,7);
      Tra(200+sqrt(2)*38,125+sqrt(2)*38,8);
      Tra(275,125,9);
      Tra(275,350,10);
    }
    if(Char===10){
      Tra(50,50,1);
      Tra(50,350,2);
      Tra(250+cos(0)*100,200+sin(0)*160,3);
      Tra(250+cos(0.5)*100,200+sin(0.5)*160,4);
      Tra(250+cos(1)*100,200+sin(1)*160,5);
      Tra(250+cos(1.5)*100,200+sin(1.5)*160,6);
      Tra(250+cos(2)*100,200+sin(2)*160,7);
      Tra(250+cos(2.5)*100,200+sin(2.5)*160,8);
      Tra(250+cos(3)*100,200+sin(3)*160,9);
      Tra(250+cos(3.5)*100,200+sin(3.5)*160,10);
      Tra(250+cos(4)*100,200+sin(4)*160,11);
      Tra(250+cos(4.5)*100,200+sin(4.5)*160,12);
      Tra(250+cos(5)*100,200+sin(5)*160,13);
      Tra(250+cos(5.5)*100,200+sin(5.5)*160,14);
      Tra(250+cos(5.9)*100,200+sin(5.9)*160,15);
      Tra(250+cos(0)*100,200+sin(0)*160,16);
    }
  if(ParX[0]!==0){
    for(var i=0; i<15; i++){
      noStroke();
      pushMatrix();
      translate(ParX[i],ParY[i]);
      rotate(ParR[i]);
      fill(sin(ParV[i]*10)*100+150,sin(ParX[i]*10)*100+150,cos(ParV[i]*15)*100+150);
      rect(-20,-20,40,40);
      popMatrix();
      ParR[i]+=0.1+ParV[i]/50;
      ParY[i]+=ParV[i];
    if(Char>10){
      if(ParY[i]>450){
        ParY[i]=random(-20,-300);
        ParX[i]=random(20,380);
        ParV[i]=random(3,5);
        ParR[i]=random(1,90);
      }
    }else{
      if(ParY[i]>1000){
        ParX=[0];
        ParY=[];
        ParV=[];
        ParR=[];
      }
    }
    }
  }
    stroke(0,0,0);
    strokeWeight(30);
    noFill();
    strokeJoin(ROUND);
    beginShape();
    for(var i=0; i<VA.length; i++){
      if(Char!==10){vertex(VA[i],VB[i]);}
    }
    if(Done===false){vertex(mouseX*400/Size,mouseY*400/Size);}
    endShape();
    if(Char===10){
      if(V1>1){line(50,50,50,350);}
      if(V1===1){line(mouseX*400/Size,mouseY*400/Size,50,50);}
      beginShape();
      for(var i=2; i<VA.length; i++){
        vertex(VA[i],VB[i]);
      }
      if(Done===false&&V1>2){vertex(mouseX*400/Size,mouseY*400/Size);}
      endShape();
    }

    popMatrix();
    if(Char>10){GameOver();}
};
