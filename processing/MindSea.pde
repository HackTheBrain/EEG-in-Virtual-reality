import oscP5.*;

// OculusRift
OculusRift oculus;

// OSC setup
OscP5 oscP5;

// Is using VR as output?
boolean vr = true;
boolean debug = true;

// Landscape parameters
int cols, rows;
int scale = 48;
int minScale = 12;
int maxScale = 512;
int w = 64 * 100;
int h = 36 * 100;
float seed = 1;
float speed = 0.03;
float[][] terrain;

// EEG Input
float[] channels;
float theta;
float minTheta = 100; 
float maxTheta = 0; 

// Spring
Spring spring;
float gravity = 1.0;
float mass = 9;

void setup() {
  smooth();
  frameRate(30);
  size(1280, 800, P3D);
  
  cols = w/scale;
  rows = h/scale;
  terrain = new float[w/minScale][h/minScale];
  
  oculus = new OculusRift(this);
  oculus.enableHeadTracking();
  
  oscP5 = new OscP5(this,"localhost", 9001, 1);
  channels = new float[16];
  
  spring = new Spring(0.0, width/2, mass, gravity);
}

void draw() {
  if (vr) {
    oculus.draw();
  } else {
    render();
  }
}

void render() {  
  // Generates terrain
  getTerrain();

  // Camera
  background(30, 60, 180, 50);
  noStroke();
  translate(width/2,height/2);
  rotateX(PI/2.3);
  lights();

  // Sphere
  pushMatrix();
  fill(255, 160, 160, 250);
  noStroke();
  spring.update(0, -1000 * (0.1 - theta));
  translate(-width/2, -1600, 0 + spring.y);
  sphereDetail(256);
  sphere(120);
  popMatrix();  

  // Land
  pushMatrix();
  translate(-w/2,-(0.85 * h));

  for (int y = 0; y < rows -1; y++) {
    float opacityModifier = map(y, 0, rows, 0, 255 * 1);
    fill(30, 60, 180, 255 - opacityModifier);
    beginShape(TRIANGLE_STRIP); 
    for (int x = 0; x < cols; x++) {
      vertex(x*scale, y*scale, terrain[x][y]);
      vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
    }
    endShape();
  }
  popMatrix();

  if (!vr) {
    camera(mouseX*1.5, mouseY*2.5, (height/2.0) / tan(PI*60.0 / 360.0), width/2.0, height/2.0, 0, 0.0, 1.0, 0.0);
  }
}

// Scene for OculusRift
void onDrawScene(int eye) {
  // The default eye position is on the origin (0, 0, 0) in the scene.
  // The parameter "eye" gives LEFT or RIGHT.
  render();
}

void getTerrain() {
  seed -= speed;
  float yseed = seed;  
  for (int y = 0; y < rows; y++) {
    float xseed = 0;
    for (int x = 0; x < cols; x++) {
      float terrainModifier = map(y, 0, rows, 0, 110);
      terrain[x][y] = map(noise(xseed,yseed), 0,1, -110, 110 - terrainModifier);
      xseed += 0.1;
    }
    yseed += 0.1;
  }  
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {  
  
    // Relative Theta
    if (theOscMessage.addrPattern().equals("/relative_theta")) {
      
      theta = parseFloat(theOscMessage.arguments()[0].toString());

      if (theta < minTheta) {
        minTheta = theta;
      }
      if (theta > maxTheta) {
        maxTheta = theta;
      }

      if (theta > 0.1) {
        speed -= 0.0001;
      } else {
        speed += 0.0001;
      }

      if (debug) println("Current: " + theta + " Min: " + minTheta + " Max: " + maxTheta);
    }
}

// Reset Oculus head possition 
void mousePressed() {
  oculus.enableHeadTracking();
}

// Change landscape
void changeLandscape(int newScale) {
  scale = constrain(newScale, minScale, maxScale);
  cols = ceil(w/scale);
  rows = ceil(h/scale);  
}

// Manual control
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      changeLandscape(scale * 2);
    } else if (keyCode==DOWN) {
      changeLandscape(scale / 2);
    }
  }
}