timevoid setup(){
  size(700,700);
};
//var strt = milllis();
var star = function(x,y,s,r,f){
  this.w1 = s*.35;
  this.w2 = s;
  this.x=x;
  this.y=y;

  pushMatrix();
  translate(this.x,this.y);
  rotate(r);
  rotate(-PI/10);
  fill(255,240,0,255*f);
  noStroke();
  beginShape();
  vertex(cos(PI/5*1)*this.w1,   sin(PI/5*1)*this.w1);
  vertex(cos(PI/5*2)*this.w2,   sin(PI/5*2)*this.w2);
  vertex(cos(PI/5*3)*this.w1,   sin(PI/5*3)*this.w1);
  vertex(cos(PI/5*4)*this.w2,   sin(PI/5*4)*this.w2);
  vertex(cos(PI/5*5)*this.w1,   sin(PI/5*5)*this.w1);
  vertex(cos(PI/5*6)*this.w2,   sin(PI/5*6)*this.w2);
  vertex(cos(PI/5*7)*this.w1,   sin(PI/5*7)*this.w1);
  vertex(cos(PI/5*8)*this.w2,   sin(PI/5*8)*this.w2);
  vertex(cos(PI/5*9)*this.w1,   sin(PI/5*9)*this.w1);
  vertex(cos(PI/5*10)*this.w2,  sin(PI/5*10)*this.w2);
  endShape();

  fill(255,200,0,100*f);
  triangle(cos(PI/5)*this.w1, sin(PI/5)*this.w1,0,0,cos(PI/5*2)*this.w2, sin(PI/5*2)*this.w2);
  triangle(cos(PI/5*3)*this.w1, sin(PI/5*3)*this.w1,0,0,cos(PI/5*4)*this.w2, sin(PI/5*4)*this.w2);
  triangle(cos(PI/5*5)*this.w1, sin(PI/5*5)*this.w1,0,0,cos(PI/5*6)*this.w2, sin(PI/5*6)*this.w2);
  triangle(cos(PI/5*7)*this.w1, sin(PI/5*7)*this.w1,0,0,cos(PI/5*8)*this.w2, sin(PI/5*8)*this.w2);
  triangle(cos(PI/5*9)*this.w1, sin(PI/5*9)*this.w1,0,0,cos(PI/5*10)*this.w2, sin(PI/5*10)*this.w2);

  rotate(-r);
  rotate(PI/10);
  translate(-this.x,-this.y);
  popMatrix();
};

var inintialClick = true;
var w = 40;
var s = [700-w,700-w];
var letters = [[0]];
var select = 0;
var strt = millis();
for(var i = 0; i < 26; i++){
    letters[i] = [random(0,s[0]),random(0,s[1]),false,0,0,false];
}
strokeWeight(3);
strokeJoin(ROUND);
textAlign(CENTER,CENTER);
textSize(30);
var stars = [[]];
void draw(){
  background(255,255,255);
  for(var i = 25; i>=0;i--){
    stroke(0);
    strokeWeight(2);
    fill(200,200,255);
    rect(letters[i][0],letters[i][1],40,40,2);
    fill(0);
    text(String.fromCharCode(i+65),letters[i][0]+20,letters[i][1]+20);
    if(letters[i][2]){
      letters[i][0]=mouseX+letters[i][3];
      letters[i][1]=mouseY+letters[i][4];

      //if(letters[i][2]&&select===2){


            if(i>0&&dist((letters[i][0]-w)/1.2,letters[i][1],(letters[i-1][0])/1.2,letters[i-1][1])<w*0.6){
              if(letters[i-1][5]===false){
              stars[stars.length] = [random(100,600),random(100,600),100,millis()];
              letters[i-1][5]=true;

              }

              letters[i-1][2]=true;
              letters[i-1][3]=letters[i][3]-w;
              letters[i-1][4]=letters[i][4];


            }





            if(i<25&&dist((letters[i][0]+w)/1.2,letters[i][1],(letters[i+1][0])/1.2,letters[i+1][1])<w*0.6){
              if(letters[i+1][5]===false){
              stars[stars.length] = [random(100,600),random(100,600),100,millis()];
              letters[i+1][5]=true;

              }
              letters[i+1][2]=true;
              letters[i+1][3]=letters[i][3]+w;
              letters[i+1][4]=letters[i][4];
            }



      //}
    }
}

  ellipse(mouseX,mouseY,5,5);
  if(select===2){
    select=0;
  }

  for(var i = 0;i<stars.length;i++){
    star(stars[i][0],stars[i][1],(millis()-strt-stars[i][3])/7,0,1-(millis()-strt-stars[i][3])/1000,200,10);
    if(1-(millis()-strt-stars[i][3])/1000<0){
      stars.splice(i,1);
    }
  }

};

void mousePressed(){
  if(inintialClick){
  for(var i = 0;i<26;i++){
  if(select===0&&mouseX>letters[i][0]&&mouseX<letters[i][0]+w&&mouseY>letters[i][1]&&mouseY<letters[i][1]+w){
    letters[i][2]=true;
    letters[i][3]=letters[i][0]-mouseX;
    letters[i][4]=letters[i][1]-mouseY;
    select = 1;
    i=26;
  }
  else if(select===1&&mouseX>letters[i][0]&&mouseX<letters[i][0]+w&&mouseY>letters[i][1]&&mouseY<letters[i][1]+w){
  select = 2;
    for(var o = 0;o<26;o++){
      letters[o][2]=false;
    }
  }
}
}
inintialClick = false;
};
void mouseClicked(){
  inintialClick = true;
}
