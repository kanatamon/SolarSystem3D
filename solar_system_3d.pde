Planet sun;

Planet mercury;
Planet venus;
Planet earth;
Planet mars;

Planet jupiter;
Planet saturn;
Planet uranus;
Planet neptune;

Planet[] planets;

float preMillis;
float t;
void setup(){
  size(1280,720,P3D);
  smooth();
  preMillis = millis();
  planets = new Planet[8];
  t = 0f;
  
  // sun initialization
  sun = new Planet(30, 0, 1);
  //sun.lightRadius = 30 * 0.8f;
  sun.isLight = true;
  sun.r = 255;
  sun.g = 182;
  sun.b = 10;
  
  // mercury initialization
  mercury = new Planet(6, 80, 0.9);
  mercury.isLight = true;
  mercury.r = 216;
  mercury.g = 83;
  mercury.b = 50;
  
  // venus initialization
  venus = new Planet(10, 140, 0.8);
  venus.isLight = true;
  venus.r = 218;
  venus.g = 181;
  venus.b = 100;
  
  // earth initialization
  earth = new Planet(8, 200, 0.7);
  earth.isLight = true;
  earth.r = 24;
  earth.g = 180;
  earth.b = 205;
  
  Planet moon = new Planet(4, 15, 1);
  moon.isLight = true;
  moon.r = 252;
  moon.g = 226;
  moon.b = 142;
  
  earth.addSatellite(moon);
  
  // mars initialization
  mars = new Planet(9, 250, 0.6);
  mars.isLight = true;
  mars.r = 247;
  mars.g = 93;
  mars.b = 69;
  
  // asteroids initialization
   for(int layer = 0; layer < 2; layer++){
    for(int i = 0 ; i < 25; i++){
      Planet obj = new Planet(1, 270 + layer * 5, 0.1 * 2 * PI * noise(t));
      t += 0.1f;
      obj.r = 192;
      obj.g = 192;
      obj.b = 192;
      
      sun.addSatellite(obj);
    }
  }
 
  // jupiter initialization
  jupiter = new Planet(15, 320, 0.4);
  jupiter.isLight = true;
  jupiter.r = 192;
  jupiter.g = 192;
  jupiter.b = 192;
  
  // saturn initialization
  saturn = new Planet(12, 380, 0.3);
  saturn.isLight = true;
  saturn.r = 196;
  saturn.g = 193;
  saturn.b = 168;
  
  // add ring
  for(int layer = 0; layer < 3; layer++){
    for(int i = 0 ; i < 5 * (1 + layer); i++){
      Planet obj = new Planet(1, 20 + layer * 4, 2 * PI * noise(t));
      t += 0.1f;
      obj.r = 192;
      obj.g = 192;
      obj.b = 192;
      
      saturn.addSatellite(obj);
    }
  }
  
  // uranus initialization
  uranus = new Planet(12, 440, 0.2);
  uranus.isLight = true;
  uranus.r = 212;
  uranus.g = 250;
  uranus.b = 251;
  
  // add ring
  for(int i = 0 ; i < 10; i++){
      Planet obj = new Planet(1, 20 , 2 * PI * noise(t));
      t += 0.1f;
      obj.r = 192;
      obj.g = 192;
      obj.b = 192;
      
      uranus.addSatellite(obj);
   }
   
  // neptune initialization
  neptune = new Planet(8, 500, 0.1);
  neptune.isLight = true;
  neptune.r = 53;
  neptune.g = 93;
  neptune.b = 212;
  
  // add ring
  for(int i = 0 ; i < 10; i++){
      Planet obj = new Planet(1, 15 , 2 * PI * noise(t));
      t += 0.1f;
      obj.r = 192;
      obj.g = 192;
      obj.b = 192;
      
      neptune.addSatellite(obj);
   }
   
  // conclude
  planets[0] = mercury;
  planets[1] = venus;
  planets[2] = earth;
  planets[3] = mars;
  
  planets[4] = jupiter;
  planets[5] = saturn;
  planets[6] = uranus;
  planets[7] = neptune;
 
}

void draw(){
  // update time delta
  float deltaTime = (millis() - preMillis )/ 1000;
  preMillis = millis();
  
  // refresh bg 
  background(0);
  //rotateX(PI / 5f);
  //rotateY(-PI / 3f);
  //rotateZ(-PI / 3f);
  translate(width/2, height/2, -300);
  
  // draw sun 
  sun.update(deltaTime);
  sun.display();
  
  // add light , any shape from here will be affected by the ligtt
  //lights(); // debug light
  pointLight(255, 255, 255, 0, 0, 0);
  
  //earth.update(deltaTime);
  //earth.display();
  //planets[5].update(deltaTime);
  for(int i = 0; i < planets.length; i++){
    planets[i].update(deltaTime);
    planets[i].display();
  }
 
}