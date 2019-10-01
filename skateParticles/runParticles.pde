// Particles, by Daniel Shiffman.

ArrayList<ParticleSystem> systems;
PImage sprite;  


int iMax=0;
int jMax=0;
int jump=40;

void setupParticles() {
  //orientation(LANDSCAPE);
  sprite = loadImage("sprite.png");
  systems = new ArrayList<ParticleSystem>();

  hint(DISABLE_DEPTH_MASK);
}

void setParticles() {
  //orientation(LANDSCAPE);
  sprite = loadImage("sprite.png");
  systems = new ArrayList<ParticleSystem>();
  //ps = new ParticleSystem(10, 100, 100);


  for (int i=0; i<width; i+=jump) {
    //println("i rows:  "+iMax);
    for (int j=0; j<height; j+=jump) {
      //jMax++;
      systems.add(new ParticleSystem(100, i, j));
      //fill(255);
      //ellipse(i, j, 10, 10);
    }
  }
  for (int i=0; i<width; i+=jump) {
    iMax++;
  }
  for (int j=0; j<height; j+=jump) {
    jMax++;
  }

  println("i rows:  "+iMax);
  println("j columns:  "+jMax);
} 

void drawParticles() {
  background(0);

  /*

   for (ParticleSystem ps : systems) {
   ps.update();
   ps.display();
   }
   
   
   */

  for (int i=0; i<iMax; i++) {
    for (int j=0; j<jMax; j++) {
      ParticleSystem curr=systems.get(i+j*iMax);
      if (i*jump>mouseX) {
        curr.emmitFlag=false;
      } else {
        curr.emmitFlag=true;
      }
    }
  }

  for (int i=0; i<iMax; i++) {
    for (int j=0; j<jMax; j++) {
      ParticleSystem curr=systems.get(i+j*iMax);
      curr.update();
      curr.display();
    }
  }

  fill(255);
  textSize(16);
  //text("Frame rate: " + int(frameRate)+"  Particles:  "+ps.particles.size(), 10, 20);
}
