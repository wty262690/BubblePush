int WX = 1300;
int WY = 900;
int numdot=400;
int numline=475;
int dotsize =40;
float wheelrotate=0;

void setup(){
  size(1300, 900,P2D);
  createdot(numdot);
  //createline(numline);
}

void draw(){
  background(0);
  //DrawLine();
  DrawDot();
  MouseIn();  
}


PVector[] Dot;
PVector[] Dotsize;
void createdot(int numdot){
  Dot = new PVector[numdot];
  Dotsize = new PVector[numdot];
  for(int i=0; i<numdot; i++){
    Dot[i]=new PVector(int(random(WX)),int(random(WY)));
    Dotsize[i]= new PVector(0,1,int(random(dotsize)));
  }
}
/*
PVector[] Line;
void createline(int numline){
  Line = new PVector[numline];
  for(int i=0; i<numline; i++){
    Line[i]=new PVector(i*10,20);
  }
}
*/

void DrawDot(){  
  push();
  fill(#1781b5); strokeWeight(0.5); stroke(255,200);
  for(int i=0; i<numdot; i++){
    Dotsize[i].x+=Dotsize[i].y;
    if (Dotsize[i].x>Dotsize[i].z){
      Dotsize[i].y=-1;
    }
    else if (Dotsize[i].x<0){
      Dotsize[i].y=1;
    }
    circle(Dot[i].x,Dot[i].y,Dotsize[i].x);
  }
  pop();
}
/*
float wei=5;
float lon=40;
float gap=50;

void DrawLine(){  
  push();
  fill(#1781b5); strokeWeight(0.5); stroke(255,200);
  rectMode(CENTER);
  float ChangeRotate=(wheelrotate)%PI;
  int line=0;
  //rotate(ChangeRotate);
  for(int i=0; i<numline; i++){
    if (i/25 !=line){
      translate(-24*gap,gap);
      line++;
    }
    else{
        translate(gap,0);
    }
    rotate(ChangeRotate*(i%33));
    rect(0,0,wei, lon);
    rotate(-ChangeRotate*(i%33));
  }
  pop();
}
*/

void MouseIn() {
  int mx=mouseX, my=mouseY;
  for (int i=0; i<numdot; i++) {
    while (dist(Dot[i].x,Dot[i].y,mx, my)<=Dotsize[i].z+100 && (Dot[i].x<=WX && Dot[i].y<=WY) && (Dot[i].x>=0 && Dot[i].y>=0)) { 
         if (Dot[i].x<=WX && Dot[i].x>=0){
           if (Dot[i].x>=mx){
            Dot[i].x ++;
           }
           else{Dot[i].x--;}
         }
         if (Dot[i].y<=WY && Dot[i].y>=0){
           if ( Dot[i].y>=my){
            Dot[i].y ++ ;
           }
           else{Dot[i].y--;}
         }
    }
   }
 }
 /*
 void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  wheelrotate +=e;
  //println(wheelrotate);
}
*/
