void setup(){
  size(700,700);
};
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
  popMatrix();
};
var strt=millis();
var stars = [[200,200,100,1]];
void draw(){

  background(200);
  star(mouseX,mouseY,100,0,1);

  for(var i = 0;i<stars.length;i++){
    star(stars[i][0],stars[i][1],(millis()-strt-stars[i][3]),0,1-(millis()-strt-stars[i][3])/1000,200,10);
    if(1-(millis()-strt-stars[i][3])/1000<0){
      stars.splice(i,1);
    }
  }
};

void mouseClicked(){
  stars[stars.length] = [mouseX-10,mouseY,100,millis(),1];

}
