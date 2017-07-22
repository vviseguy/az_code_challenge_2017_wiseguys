var Size = 500;
void setup(){
  size(Size,Size);
}
var ParXf = [];
var ParYf = [];
var ParX = [];
var ParY = [];
var Start = true;
var V1 = 0;
var V2 = 0;
var V3 = 0;
var VA = [];
var VB = [];
var VC = [];
var VD = [];
var RotG = 0;
var GameOver = function(A,B){
  background(255,255,255);
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
var NumB = function(A,B,V){
  if(V>V1){
    fill(155, 0, 255);
    ellipse(A,B,40,40);
    fill(145, 0, 235);
    ellipse(A-2,B-2,35,35);
    fill(135, 0, 215);
    ellipse(A-3,B-3,30,30);
    fill(135, 0, 215);
    ellipse(A-4,B-4,30,30);
    fill(125, 0, 205);
    ellipse(A-6,B-6,20,20);
    if(V1===V-1&&V2>500){fill(150,255,0,200); ellipse(A,B,40,40);}
    fill(0,0,0);
    text(V,A,B+7);
    text(V,A,B+7);
  }
};
draw = function() {
  noStroke();
  var Count = 20;
    if(Start===true){
      for(var i=0; i<Count; i++){
        VA.push(random(20,380));
        VB.push(random(20,380));
        VC.push(cos(VA[i]));
        VD.push(cos(VB[i]));
      }
        Start=false;
    }
    textSize(20);
    textAlign(CENTER);
    fill(0,0,0,80);
    rect(0,0,Size,Size);
    pushMatrix();
    scale(Size/400,Size/400);
    for(var i=Count-1; i>=0; i--){
        NumB(VA[i],VB[i],i+1);
        VA[i]+=VC[i]*2;
        VB[i]+=VD[i]*2;
        if(VA[i]>380){VA[i]=380; VC[i]=-VC[i];}
        if(VB[i]>380){VB[i]=380; VD[i]=-VD[i];}
        if(VA[i]<20){VA[i]=20; VC[i]=-VC[i];}
        if(VB[i]<20){VB[i]=20; VD[i]=-VD[i];}
    }
    if(V2===750||V2===1000||V2===1050||V2===1100){VC[V1]=VC[V1]/2; VD[V1]=VD[V1]/2;}
    var MX = (mouseX*400/Size);
    var MY = (mouseY*400/Size);
    if(mousePressed&&sq(MX-VA[V1])+sq(MY-VB[V1])<=1000){
      for(var i=0; i<15; i++){
        ParX.push(VA[V1]+random(-15,15));
        ParY.push(VB[V1]+random(-15,15));
        ParXf.push(random(-4,4));
        ParYf.push(random(-6,2));
      }
      V2=0;
    V1++;}
    V2++;
    if(V1===Count&&V2>150){
      for(var i=0; i<50; i++){
        ParX.push(200);
        ParY.push(200);
        ParXf.push(random(-8,8));
        ParYf.push(random(-12,4));
      }
      for(var i=0; i<30; i++){
        ParX.push(200);
        ParY.push(200);
        ParXf.push(random(-3,3));
        ParYf.push(random(-12,4));
      }
      V2=0;
      V1++;
    }
    for(var i=0; i<ParX.length; i++){
      if(ParY[i]<410&&ParX[i]>0&&ParX[i]<400){
      fill(155,0,255);
      ellipse(ParX[i],ParY[i],10,10);
      ParYf[i]+=0.1;
      ParX[i]+=ParXf[i];
      ParY[i]+=ParYf[i];
      if(ParY[ParX.length-1]>410){
        ParY.pop(); ParX.pop(); ParXf.pop(); ParYf.pop();
      }
      }
    }
    popMatrix();
    if(V1>Count&&ParX.length<=1){GameOver();}
};
