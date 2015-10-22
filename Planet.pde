class Planet{
  public float diameter;
  public float distance;
  public float lightRadius;
  //public float smoothness;
  //public color c;
  
  public boolean isLight;
 
  public float orbitSpeed;
  
  private Planet[] satellites;
  private float theta;
  private float r;
  private float g;
  private float b;
  
  public float rotation;
  
  Planet(float _diameter, float _distance, float _orbitSpeed){
    diameter = _diameter;
    distance = _distance;
    lightRadius = diameter * 0.5f;
    //c = _c;
    orbitSpeed = _orbitSpeed;
    
    isLight = false;
    theta = 0;
    satellites = new Planet[0];
    r = 255;
    g = 255;
    b = 255;
    rotation = 0;
  }
  
  public void update(float deltaTime){
    theta += deltaTime * orbitSpeed;
    
    for(int i = 0; i < satellites.length; i++){
      satellites[i].update(deltaTime);
    }
  }
  
  public void display(){
    pushMatrix();
      //rotateZ(theta);
      rotateY(radians(rotation));
      rotateZ(theta);
      translate(distance, 0, 0);
         // draw their moon
        for(int i = 0; i < satellites.length; i++){
          satellites[i].display();
        }
        
        // draw the planet
        noStroke();
        fill(r,g,b);
        sphere(diameter);
         
        if(isLight){
          drawFadeEffect();
        }
        //ambientLight(r,g,b);
        
    popMatrix();
  }
  
  public void addSatellite(Planet newSatellite){
    satellites = (Planet[]) append(satellites, newSatellite);
  }
  
  public void drawFadeEffect(){
    //noLights();
    float percent = 0;
    float step = 1 / (diameter * 0.5);
    
    color from = color(r,g,b,50);
    color to = color(r,g,b,0);
    
    while(percent <= 1f){
      percent += step;
      color interpolation = lerpColor(from, to, percent);
      noStroke();
      fill(interpolation);
      sphere(diameter + lightRadius * percent);
    }
    //lights();
    //pointLight(255, 255, 255, 0, 0, 0);
  }
  
}