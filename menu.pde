void setup()
{
  size(400,400);
  background(0);

}
var lagControl = 1;
if(lagControl===0){
var vines=true;
}
else if(lagControl===1){
var vines=false;
}

var scene = 0;
var level = 0;

var time = 0;
var speed = 1;
var jump = 7;
var climb = 0.75;

var score = 0;
var health = 3;

var kPressed = "";
if(1===1){
var grav = 0.5;
var num = 20;
var spd = 0.125;
var bubbles = [
[random(5,35),random(0,60),random(0,5),color(random(185,209),random(160,215),random(100,200),150),random(0,spd)],
];
for(var i = 0;i<num;i++){
bubbles[i] = [random(5,35),random(0,60),random(0,5),color(random(185,209),random(160,215),random(100,200),150),random(0,spd)];
}
var bubble = function(rib,c,speed){
    for(var i = 0; i < rib;i++){
    noStroke();
    fill(bubbles[i][3]);
    ellipse(bubbles[i][0],bubbles[i][1],bubbles[i][2],bubbles[i][2]);

    bubbles[i][1]-=(0.5+bubbles[i][4])*speed;
    if(bubbles[i][1]<0-bubbles[i][2]-10){
    bubbles[i][0]=random(5,35);
    bubbles[i][1]=random(10,60);
    bubbles[i][2]=random(0,5);
    bubbles[i][3]=color(random(185,209),random(160,215),random(100,200),150);
    bubbles[i][4]=random(0,spd);
    fill(191, 162, 111);

    }
    }
};
}
var world= [[[[]]],[[[]]],[[[]]],[[[]]],[[[]]],[[[]]],[[[]]],[[[]]],[[[]]]];
world[0] = [
    [10,0,0,0,0,10,10,0,12,10],
    [10,22,0,0,0,10,10,0,0,10],
    [6,6,6,6,6,10,6,6,6,6],
    [0,0,0,0,0,10,0,22,0,10],
    [0,21,0,0,0,10,0,0,0,10],
    [0,6,6,6,6,10,0,0,22,10],
    [0,0,0,0,0,10,0,0,0,6],
    [0,0,0,0,0,10,0,0,0,0],
    [0,2,0,0,0,11,0,0,0,0],
    [1,1,1,1,1,1,1,1,1,1],
    ];
world[1] = [
    [10,12,0,0,10,0,0,0,10,10],
    [10,0,0,22,10,0,14,0,10,10],
    [6,6,6,6,6,6,6,6,6,10],
    [0,0,0,0,0,10,22,10,0,10],
    [0,21,0,0,0,10,0,10,0,10],
    [0,6,6,6,6,0,0,10,0,10],
    [0,22,0,0,0,0,0,0,0,10],
    [0,0,0,0,0,0,0,0,0,10],
    [2,0,0,0,0,0,0,14,0,0],
    [1,1,1,1,1,1,1,1,1,1],
    ];
world[2] = [
    [0,0,0,10,0,10,0,10,0,0],
    [0,2,0,10,0,10,0,10,0,22],
    [1,1,0,0,0,0,0,0,0,0],
    [7,7,7,7,7,7,6,0,0,0],
    [6,6,6,6,6,6,6,0,0,0],
    [0,0,10,10,0,10,22,0,1,1],
    [22,0,0,0,0,10,0,0,0,12],
    [6,0,0,0,0,10,0,0,0,1],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [7,7,7,7,7,7,7,7,7,7],
    ];
world[3] = [
    [10,2,0,0,10,0,0,10,0,12],
    [10,1,0,0,10,0,0,10,0,1],
    [10,0,0,0,0,22,0,0,0,0],
    [10,0,0,0,0,0,0,0,0,0],
    [10,0,0,0,0,0,0,0,0,0],
    [10,0,0,0,0,0,0,0,0,0],
    [10,0,0,0,0,0,0,0,0,0],
    [10,0,0,0,22,0,22,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [1,1,7,1,7,1,7,1,7,1],
    ];
world[4] = [
    [0,2,0,0,0,10,0,10,0,0],
    [0,1,1,0,0,0,0,10,0,0],
    [0,10,0,1,0,22,0,0,0,0],
    [0,10,0,22,0,0,0,0,0,1],
    [0,10,0,0,0,0,0,0,0,12],
    [0,0,0,0,0,0,0,0,0,0],
    [1,22,0,0,0,0,0,0,1,0],
    [0,0,1,0,0,0,0,0,0,0],
    [0,0,0,0,0,1,0,0,0,0],
    [7,7,7,7,7,7,7,7,7,7],
    ];
world[5] = [
    [22,10,0,10,0,10,0,10,0,10],
    [0,0,0,0,0,0,0,0,0,10],
    [0,0,0,0,0,0,0,0,0,10],
    [0,1,0,1,1,1,1,1,1,10],
    [0,1,0,1,12,0,10,22,1,10],
    [22,1,0,1,1,1,10,0,1,10],
    [0,1,0,0,0,0,0,0,1,10],
    [0,1,1,1,1,1,1,1,1,10],
    [2,0,0,0,0,0,0,0,0,0],
    [1,1,1,1,1,1,1,1,1,1],

    ];
world[6] = [
    [8,0,0,0,11,0,0,0,0,0],
    [8,1,1,1,1,1,1,1,1,1],
    [8,0,0,2,0,0,0,0,0,0],
    [8,0,0,1,0,0,0,0,0,0],
    [8,0,0,0,0,0,0,0,0,0],
    [8,0,0,0,0,0,0,0,0,0],
    [8,0,0,0,0,0,0,0,0,0],
    [8,0,0,0,0,0,0,0,0,0],
    [8,0,0,0,0,0,0,0,0,0],
    [8,0,0,0,0,0,0,0,0,0],
    [7,7,7,7,7,7,7,7,7,7],
    ];
world[123] = [
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [7,7,7,7,7,7,7,7,7,7],
    ];
var player = [0,320,8,0];
var resetting = true;
var player = function(size){

    scale(size,size);
    translate(-player[0]/size,-player[1]/size);
    fill(179, 149, 93);
    noStroke();
    rect(player[0]+5,player[1]+10,30,30,5);
    stroke(0, 0, 0);
    strokeWeight(1);
    ellipse(player[0]+17,player[1]+22,5,5);
    ellipse(player[0]+27,player[1]+22,5,5);
    arc(player[0]+15,player[1]+30,30,5,-10,100);
    fill(84, 48, 18);
    noStroke();
    ellipse(player[0]+20,player[1]+12,35,10);
    fill(102, 63, 33);
    ellipse(player[0]+20,player[1]+12,25,7);
    fill(117, 79, 49);
    ellipse(player[0]+20,player[1]+12,20,5);
    fill(84, 48, 18);
    rect(player[0]+10,player[1]+0,20,12,5);

    translate(player[0]/size,player[1]/size);
    scale(1/size,1/size);
    };
var reset = function(){
var resetting = true;
};

var windFriction = 0.125;
var change = [0,0];
var vine = function (x,y,length,spacing){
   if(vines){
   for(var i = 5;i<length-10;i++){

   if((i)%spacing===0){
   translate(x+20,(y+i));
   rotate(90);
   translate(-x-20,-(y+i));
   //image(getImage("avatars/leaf-green"),x+20,y+i,20,20);
   translate(x+20,(y+i));
   rotate(-90);
   translate(-x-20,-(y+i));

   }
   if(i%spacing===spacing/2){
   translate(x,(y+i));
   rotate(180);
   translate(-x,-(y+i));
   //image(getImage("avatars/leaf-green"),x,y+i,20,20);
   translate(x,(y+i));
   rotate(-180);
   translate(-x,-(y+i));
   }

   }
stroke(105, 166, 20);
   strokeWeight(5);
   line(x+9.5,y,x+9.5,y+length);
   }
};
void draw = function() {
   if(scene === 0){
    background(89, 71, 25);
    player[0]=70;
    player[1]=51;

    noStroke();
    fill(207, 207, 72,15);
    quad(250,0,350,0,387.5,150,212.5,150);
    quad(250,0,350,0,400,200,200,200);
    quad(250,0,350,0,412.5,250,187.5,250);
    quad(250,0,350,0,425,300,175,300);
    quad(250,0,350,0,437.5,350,162.5,350);
    quad(250,0,350,0,450,400,150,400);


    translate(150,0);
    scale(7);
    bubble(num,bubbles[0][3],0.2);
    scale(1/7);
    translate(-150,0);


    player(4);


    stroke(171, 145, 72);
    rect(50,165,125,29,400);
    rect(50,225,125,29,400);
    rect(50,285,125,29,400);

    textFont("serif",20);
    textAlign(CENTER,CENTER);
    textSize(150);
    fill(110, 91, 41);
    scale(2/4,1);
    text("ESCAPE",350,70);
    text("ESCAPE",354,70);
    text("ESCAPE",352,70);
    text("ESCAPE",348,70);
    text("ESCAPE",346,70);
    scale(4/2,1);
    rotate(90);
    textSize(50);
    fill(173, 151, 95);
    text("Rope",73,-341);
    rotate(-90);
    textSize(18);
    fill(171, 145, 72);
    text("PLAY",115,181);
    if(mouseX>50&&mouseX<175&&mouseY>165&&mouseY<194){
    cursor("pointer");
    }
    else if(mouseX>50&&mouseX<175&&mouseY>225&&mouseY<254){
    cursor("pointer");
    }
    else if(mouseX>50&&mouseX<175&&mouseY>285&&mouseY<314){
    cursor("pointer");
    }
    else{
    cursor("auto");
    }
    mouseReleased = function(){
    if(mouseX>50&&mouseX<175&&mouseY>165&&mouseY<194){
    scene=1;
    cursor("auto");
    }
    else if(mouseX>50&&mouseX<175&&mouseY>225&&mouseY<254){
    cursor("auto");

    }
    else if(mouseX>50&&mouseX<175&&mouseY>285&&mouseY<314){
    cursor("auto");

    }
    };
    }
else if(scene === 1){
    time++;

    if(1===1){
    background(105, 87, 41);

vine(200,20,354,20);
vine(20,50,182,20);
vine(294,109,226,20);
vine(93,208,205,20);
fill(0,0,0,90);
rect(-10,-10,420,420);
    }
    player[0]+=change[0];
    if(abs(change[0])>7){
    change[0]=change[0]-2*abs(change[0])/change[0];
    }
    if(player[0]<-5){
    change[0]=0;
    player[0]=-5;
    }
    else if(player[0]>365){
    change[0]=0;
    player[0]=365;
    }
    if(player[1]<-5){
    player[1]=-5;
    }
    else if(player[1]>365){
        resetting=true;
    }
    player[1]+=change[1];
    if(time%3===0&&(world[level][round((player[1]-19)/40+1)][ceil((player[0]-20)/40)]===1||world[level][round((player[1]-19)/40+1)][ceil((player[0]-20)/40)]===6)){
    change[0]/=2;
  }
    else if(time%3===0&&(world[level][round((player[1]-19)/40+1)][ceil((player[0]-20)/40)]===11||world[level][round((player[1]-19)/40+1)][ceil((player[0]-20)/40)]===12||world[level][round((player[1]-19)/40+1)][ceil((player[0]-20)/40)]===10)){
    change[1]+=grav;
    if(abs(change[1])>1){
    change[0]/=2;
    }
    change[1]/=2;
    change[0]/=2;

  }

    for(var i = 0;i<world[level].length;i++){
    for(var o = 0;o<world[level][i].length;o++){
    if(world[level][i][o]===1){

    noStroke();
    fill(120, 120, 120);
    rect(o*40,i*40,40,40,2);
    strokeWeight(1);
    stroke(56, 56, 56);
    line(o*40,i*40+1,o*40,i*40+39);
    line(o*40+2,i*40,o*40+38,i*40);
    line(o*40,i*40+3,o*40+40,i*40+3);
    line(o*40,i*40+29,o*40+40,i*40+29);
    noFill();

    ellipse(o*40+20,i*40+16,20,20);
    ellipse(o*40+25,i*40+12,2.5,2.5);
    ellipse(o*40+17.5,i*40+12,2.5,2.5);
    ellipse(o*40+22,i*40+19,7,8);

    line(o*40+2,i*40+35,o*40+4,i*40+39);
    line(o*40+2,i*40+35,o*40+4,i*40+31);
    line(o*40+3,i*40+37,o*40+3,i*40+33);

    line(o*40+6,i*40+35,o*40+8,i*40+39);
    line(o*40+6,i*40+35,o*40+8,i*40+31);
    line(o*40+7,i*40+37,o*40+7,i*40+33);


    line(o*40+16,i*40+35,o*40+18,i*40+39);
    line(o*40+16,i*40+35,o*40+18,i*40+31);
    line(o*40+17,i*40+37,o*40+17,i*40+33);

    line(o*40+20,i*40+31.5,o*40+35,i*40+31.5);
    line(o*40+21,i*40+32,o*40+23,i*40+34);
    line(o*40+25,i*40+32,o*40+23,i*40+34);
    line(o*40+30,i*40+32,o*40+28,i*40+34);
    line(o*40+25,i*40+32,o*40+28,i*40+34);
    line(o*40+30,i*40+32,o*40+33,i*40+34);
    line(o*40+34,i*40+32,o*40+33,i*40+34);
    line(o*40+23,i*40+34,o*40+32,i*40+34);
    line(o*40+23,i*40+34,o*40+25,i*40+36);
    line(o*40+28,i*40+34,o*40+25,i*40+36);
    line(o*40+32,i*40+34,o*40+30,i*40+36);
    line(o*40+28,i*40+34,o*40+30,i*40+36);
    line(o*40+25,i*40+38,o*40+25,i*40+36);
    line(o*40+30,i*40+38,o*40+30,i*40+36);

    }
    else if(world[level][i][o]===3&&resetting){
        world[level][i][o][0]=0;
        }
    else if(world[level][i][o]===2&&resetting){

        player = [o*40,i*40,o,i];
        resetting=false;

    }
    else if(world[level][i][o]===3){
    stroke(0, 0, 0);
    strokeWeight(1);
    world[level][i][o][0]=time;
    rect(o*40,i*40+time,40,40,2);

    }
    else if(world[level][i][o]===4){
    stroke(0, 0, 0);
    strokeWeight(1);
    fill(255, 0, 0);
    rect(o*40,i*40,10,40,2);
    rect(o*40+10,i*40,10,40,2);
    rect(o*40+20,i*40,10,40,2);
    rect(o*40+30,i*40,10,40,2);
    fill(255, 255, 255);
    rect(o*40,i*40+15,40,10,1);
    fill(0, 0, 0);
    textFont(createFont("serif"),10);
    textAlign(CENTER,CENTER);
    text("TNT",o*40+20,i*40+20);
    }
    else if(world[level][i][o]===5){
        fill(255, 0, 0);
    rect(o*40,i*40,10,40,2);
    rect(o*40+10,i*40,10,40,2);
    rect(o*40+20,i*40,10,40,2);
    rect(o*40+30,i*40,10,40,2);
    fill(255, 255, 255);
    rect(o*40,i*40+15,40,10,1);
    fill(0, 0, 0);
    textFont(createFont("serif"),10);
    textAlign(CENTER,CENTER);
    text("TNT",o*40+20,i*40+20);
    playSound(getSound("retro/boom1"));
    world[level][i+1][o+1]=0;
    world[level][i+1][o]=0;
    world[level][i][o+1]=0;
    world[level][i][o]=0;
    if(o>1){
    if(i>1){
    world[level][i-1][o-1]=0;
    }
    world[level][i][o-1]=0;
    world[level][i+1][o-1]=0;
    }
    if(i>1){
    world[level][i-1][o]=0;
    world[level][i-1][o+1]=0;


    }
    }
    else if(world[level][i][o]===6){
    scale(2,2);
    noStroke();
    stroke(79, 52, 12);
    strokeWeight(2);
    fill(150, 127, 81);
    rect(o*20,i*20,18,18,1);
    strokeWeight(1);
    rect(o*20+3,i*20+3,12,12,1);
    rect(o*20+6,i*20+6,6,6,1);
    scale(1/2,1/2);
    }
    else if(world[level][i][o]===7){

    noStroke();
    if(o>0&&world[level][i][o-1]===7){
    fill(255, 149, 0);
    rect(o*40-7,i*40+10,40,30);
    fill(255, 115, 0);
    rect(o*40-7,i*40+12,40,28);
    fill(255, 85, 0);
    rect(o*40-7,i*40+15,40,25);
    fill(255, 77, 0);
    rect(o*40-7,i*40+17,40,23);
    }
    else{
    fill(255, 149, 0);
    rect(o*40,i*40+10,40,30);
    fill(255, 115, 0);
    rect(o*40+2,i*40+12,36,28,2);
    fill(255, 85, 0);
    rect(o*40+5,i*40+15,30,25,3);
    fill(255, 77, 0);
    rect(o*40+7,i*40+17,26,23,3);
    }
    if(o>0&&world[level][i][o+1]!==7){
    fill(255, 149, 0);
    rect(o*40,i*40+10,40,30);
    fill(255, 115, 0);
    rect(o*40+2,i*40+12,36,28,2);
    fill(255, 85, 0);
    rect(o*40+5,i*40+15,30,25,3);
    fill(255, 77, 0);
    rect(o*40+7,i*40+17,26,23,3);
    if(o>0&&world[level][i][o-1]===7){
    fill(255, 149, 0);
    rect(o*40-7,i*40+10,40,30);
    fill(255, 115, 0);
    rect(o*40-7,i*40+12,40,28);
    fill(255, 85, 0);
    rect(o*40-7,i*40+15,40,25);
    fill(255, 77, 0);
    rect(o*40-7,i*40+17,40,23);
    }
    }
    }
    else if(world[level][i][o]===8){

    noStroke();
    if(o>0&&world[level][i][o-1]===8){
    fill(0, 179, 255);
    rect(o*40-7,i*40+10,40,30);
    fill(0, 136, 255);
    rect(o*40-7,i*40+12,40,28);
    fill(0, 98, 255);
    rect(o*40-7,i*40+15,40,25);
    fill(0, 77, 255);
    rect(o*40-7,i*40+17,40,23);
    }
    else{
    fill(0, 179, 255);
    rect(o*40,i*40+10,40,30);
    fill(0, 136, 255);
    rect(o*40+2,i*40+12,36,28,2);
    fill(0, 98, 255);
    rect(o*40+5,i*40+15,30,25,3);
    fill(0, 77, 255);
    rect(o*40+7,i*40+17,26,23,3);
    }
    if(i>0&&world[level][i-1][o]===8){
    fill(0, 179, 255);
    rect(o*40,i*40-5,40,45);
    fill(0, 136, 255);
    rect(o*40+2,i*40-5,36,45,2);
    fill(0, 98, 255);
    rect(o*40+5,i*40-5,30,45,3);
    fill(0, 77, 255);
    rect(o*40+7,i*40-5,26,45,3);
    }
    if(o>0&&world[level][i][o+1]!==8){
    fill(0, 179, 255);
    rect(o*40,i*40+10,40,30);
    fill(0, 136, 255);
    rect(o*40+2,i*40+12,36,28,2);
    fill(0, 98, 255);
    rect(o*40+5,i*40+15,30,25,3);
    fill(0, 77, 255);
    rect(o*40+7,i*40+17,26,23,3);
    if(o>0&&world[level][i][o-1]===8){
    fill(0, 179, 255);
    rect(o*40-7,i*40+10,40,30);
    fill(0, 136, 255);
    rect(o*40-7,i*40+12,40,28);
    fill(0, 98, 255);
    rect(o*40-7,i*40+15,40,25);
    fill(0, 77, 255);
    rect(o*40-7,i*40+17,40,23);
    }
    }
    }
    else if(world[level][i][o]===10){
    if(world[level][i+1][o]===10||world[level][i+1][o]===6||world[level][i+1][o]===1||world[level][i+1][o]===5||world[level][i+1][o]===4||world[level][i+1][o]===11){
       noStroke();
    fill(204, 188, 159);
    rect(o*40+17,i*40,6,40);
    stroke(181, 150, 114);
    strokeWeight(1);
    line(o*40+17,i*40+5,o*40+23,i*40);
    line(o*40+17,i*40+10,o*40+23,i*40+5);
    line(o*40+17,i*40+15,o*40+23,i*40+10);
    line(o*40+17,i*40+20,o*40+23,i*40+15);
    line(o*40+17,i*40+25,o*40+23,i*40+20);
    line(o*40+17,i*40+30,o*40+23,i*40+25);
    line(o*40+17,i*40+35,o*40+23,i*40+30);
    line(o*40+17,i*40+40,o*40+23,i*40+35);
    }
    else{
     noStroke();
    fill(204, 188, 159);
    rect(o*40+17,i*40,6,18);
    rect(o*40+17,i*40,6,20,5);
    stroke(181, 150, 114);
    strokeWeight(1);
    line(o*40+17,i*40+5,o*40+23,i*40);
    line(o*40+17,i*40+10,o*40+23,i*40+5);
    line(o*40+17,i*40+15,o*40+23,i*40+10);
    line(o*40+18,i*40+19,o*40+22,i*40+15);

    stroke(204, 188, 159);
    noFill();
    arc(o*40+10,i*40+19,15,5,0,80);
    arc(o*40+29,i*40+15,15,20,100,180);
    arc(o*40+18,i*40+20,5,30,0,80);
    stroke(181, 150, 114);
    arc(o*40+15,i*40+20,10,20,0,80);
    arc(o*40+27,i*40+20,10,20,100,180);
    arc(o*40+14,i*40+19,10,10,0,80);
    }
    }
    else if(world[level][i][o]===11){

     noStroke();
    fill(204, 188, 159);
    rect(o*40+17,i*40,6,18);
    rect(o*40+17,i*40,6,20,5);
    stroke(181, 150, 114);
    strokeWeight(1);
    line(o*40+17,i*40+5,o*40+23,i*40);
    line(o*40+17,i*40+10,o*40+23,i*40+5);
    line(o*40+17,i*40+15,o*40+23,i*40+10);
    line(o*40+18,i*40+19,o*40+22,i*40+15);

    stroke(204, 188, 159);
    noFill();
    arc(o*40+10,i*40+19,15,5,0,80);
    arc(o*40+29,i*40+15,15,20,100,180);
    arc(o*40+18,i*40+20,5,30,0,80);
    stroke(181, 150, 114);
    arc(o*40+15,i*40+20,10,20,0,80);
    arc(o*40+27,i*40+20,10,20,100,180);
    arc(o*40+14,i*40+19,10,10,0,80);

    }
    else if(world[level][i][o]===12){
        translate(o*40,i*40);
    bubble(num,bubbles[i][3],1);
     translate(-o*40,-i*40);
     noStroke();
    fill(204, 188, 159);
    rect(o*40+17,i*40,6,18);
    rect(o*40+17,i*40,6,20,5);
    stroke(181, 150, 114);
    strokeWeight(1);
    line(o*40+17,i*40+5,o*40+23,i*40);
    line(o*40+17,i*40+10,o*40+23,i*40+5);
    line(o*40+17,i*40+15,o*40+23,i*40+10);
    line(o*40+18,i*40+19,o*40+22,i*40+15);

    stroke(204, 188, 159);
    noFill();
    arc(o*40+10,i*40+19,15,5,0,80);
    arc(o*40+29,i*40+15,15,20,100,180);
    arc(o*40+18,i*40+20,5,30,0,80);
    stroke(181, 150, 114);
    arc(o*40+15,i*40+20,10,20,0,80);
    arc(o*40+27,i*40+20,10,20,100,180);
    arc(o*40+14,i*40+19,10,10,0,80);

    }
    else if(world[level][i][o]===21){
        imageMode(CENTER);
        translate((o*40+20),(i*40+20));
        scale(sin(time*2)*1/3,1/3);
        translate(-(o*40+20),-(i*40+20));

    image(getImage("cute/Heart"),(o*40+20),(i*40+20));

    translate((o*40+20),(i*40+20));
    scale(1/sin(time*2)*3,3);
    translate(-(o*40+20),-(i*40+20));


    }
    else if(world[level][i][o]===22){
        imageMode(CENTER);
        translate((o*40+20),(i*40+20));
        scale(sin(time*2)*1/3,1/3);
        translate(-(o*40+20),-(i*40+20));

    image(getImage("space/star"),(o*40+20),(i*40+20));

    translate((o*40+20),(i*40+20));
    scale(1/sin(time*2)*3,3);
    translate(-(o*40+20),-(i*40+20));


    }
    }
    }

if(1===1){
    fill(179, 149, 93);
    noStroke();
    rect(player[0]+5,player[1]+10,30,30,5);
    stroke(0, 0, 0);
    ellipse(player[0]+17,player[1]+22,5,5);
    ellipse(player[0]+27,player[1]+22,5,5);
    arc(player[0]+15,player[1]+30,30,5,-10,100);
    fill(84, 48, 18);
    noStroke();
    ellipse(player[0]+20,player[1]+12,35,10);
    fill(102, 63, 33);
    ellipse(player[0]+20,player[1]+12,25,7);
    fill(117, 79, 49);
    ellipse(player[0]+20,player[1]+12,20,5);
    fill(84, 48, 18);
    rect(player[0]+10,player[1]+0,20,12,5);
} //player body
if(world[level][round((player[1]-19)/40+1)][ceil((player[0]-20)/40)]===0||world[level][round((player[1]-19)/40+1)][ceil((player[0]-20)/40)]===2||world[level][round((player[1]-19)/40+1)][ceil((player[0]-20)/40)]===21||world[level][round((player[1]-19)/40+1)][ceil((player[0]-20)/40)]===22){
    change[1]+=grav;
    }
else if(world[level][round((player[1]-19)/40+1)][ceil((player[0]-20)/40)]===1||world[level][round((player[1]-19)/40+1)][ceil((player[0]-20)/40)]===6){
    if(abs(change[1])>1){
    change[0]/=4;
    }
    change[1]=0;



    }
    else{
if(world[level][round((player[1]-19)/40+1)][ceil((player[0]-20)/40)]===12){

resetting=true;
level++;
}

    }
if((world[level][round((player[1]-19)/40+1)][ceil((player[0]-20)/40)]===1||world[level][round((player[1]-19)/40+1)][ceil((player[0]-20)/40)]===6)&& world[level][round((player[1]-19)/40)][ceil((player[0]-20)/40)]===0){
player[1]=round((player[1]-19)/40)*40;
}

if(round((player[1]-19)/40)>0&&world[level][round((player[1]-19)/40)][ceil((player[0]-20)/40)]===21){
health++;
world[level][round((player[1]-19)/40)][ceil((player[0]-20)/40)]=0;
}
else if(round((player[1]-19)/40)>0&&world[level][round((player[1]-19)/40)][ceil((player[0]-20)/40)]===22){
score++;
world[level][round((player[1]-19)/40)][ceil((player[0]-20)/40)]=0;
}


if(kPressed===LEFT){
change[0]-=speed;
}
else if(kPressed===RIGHT){
change[0]+=speed;
}
else if(kPressed===UP){
if(world[level][round((player[1]-20)/40+1)][ceil((player[0]-20)/40)]!==0&&world[level][round((player[1]-20)/40+1)][ceil((player[0]-20)/40)]!==2&&world[level][round((player[1]-20)/40+1)][ceil((player[0]-20)/40)]!==21&&world[level][round((player[1]-20)/40+1)][ceil((player[0]-20)/40)]!==22){
if(round((player[1]+20)/40)>0&&(world[level][ceil((player[1]-20)/40)][ceil((player[0]-20)/40)]===11||world[level][ceil((player[1]-20)/40)][ceil((player[0]-20)/40)]===12||world[level][ceil((player[1]-20)/40)][ceil((player[0]-20)/40)]===10)){
change[1]-=climb;
if(world[level][round((player[1]-20)/40+1)][ceil((player[0]-20)/40)]===6||world[level][round((player[1]-20)/40+1)][ceil((player[0]-20)/40)]===1){
change[1]-=1.0001-climb;
}
}
else if(world[level][ceil((player[1]-20)/40)][ceil((player[0]-20)/40)]===7||world[level][ceil((player[1]-20)/40)][ceil((player[0]-20)/40)]===7){
change[1]-=climb/3;

}

else if (world[level][round((player[1]-20)/40+1)][ceil((player[0]-20)/40)]!==7&&world[level][round((player[1]-20)/40+1)][ceil((player[0]-20)/40)]!==7){
change[1]=-jump;
}
}
}
else if(kPressed===DOWN){
if(world[level][ceil((player[1]-20)/40+1)][ceil((player[0]-20)/40)]===11||world[level][ceil((player[1]-20)/40+1)][ceil((player[0]-20)/40)]===12||world[level][ceil((player[1]-20)/40+1)][ceil((player[0]-20)/40)]===10||world[level][ceil((player[1]-20)/40+1)][ceil((player[0]-20)/40)]===0){
change[1]+=2;
}

}


}


};
void keyPressed = function(){
kPressed=keyCode;
};
void keyReleased = function(){
kPressed="";
};
