// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Demonstration of Craig Reynolds' "Flocking" behavior
// See: http://www.red3d.com/cwr/
// Rules: Cohesion, Separation, Alignment

// Click mouse to add boids into the system

Flock flock;

//just add a predator class which does everything,
//everything else stays the same
Predator predator;
Predator predator2;
Predator predator3;
Predator predator4;

void setup() {
  size(1240, 480);
  //frameRate(2);
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 300; i++) {
    Boid b = new Boid(random(0, width/2), random(0, height));
    Boid b2 = new Boid(random(width/2, width), random(0, height));
    Boid b3 = new Boid(width/2, height/2);

    flock.addBoid(b);
    flock.addBoid(b2);
    flock.addBoid(b3);
  }
  predator = new Predator(width/5, height/2);
  predator2 = new Predator(4*width/5, height/2);
  predator3 = new Predator(width/5, 100);
  predator4 = new Predator(width/5, height - 100);
}

void draw() {
  background(255);
  //predator moves via perlin noise
  PVector predatorMovement = new PVector((sin(frameCount*.01)), (cos(frameCount*.03)));
  PVector predatorMovement2 = new PVector((sin(frameCount*.01)), (sin(frameCount*.03)));
  PVector predatorMovement3 = new PVector(100, 0);
  PVector predatorMovement4 = new PVector(-100, 0);

  predatorMovement2.mult(-1);
  predator.applyForce(predatorMovement);
  predator2.applyForce(predatorMovement2);
  predator3.applyForce(predatorMovement3);
  predator4.applyForce(predatorMovement4);


  //pass in all the boids to the predator
  predator.predate(flock.boids);
  predator2.predate(flock.boids);
  predator3.predate(flock.boids);
  predator4.predate(flock.boids);
  
  flock.run();
}