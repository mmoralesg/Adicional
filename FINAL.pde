disco izquierdo;
disco derecho;
brazo unico;

color c;

void setup()
{
  background(255);
  size(600, 600);
  frameRate(100000);
  frame.setTitle("Trazo");
  c = color(random(255), random(255), random(255));

  //Degradado
  noStroke();
  for (float r = 255; r>=0; r--)
  {
    fill(255-r);
    ellipse(width/2, height/2, r*6, r*6);
  }

  //(radio del disco, distancia del pivote a partir del centro, fase(grad) del pivote, posición del disco en x, posición del sico en y);
  izquierdo = new disco(200, 500, 154, 0, 300);
  derecho = new disco(500, 0, 95, 600, 600);
}

void draw()
{
  frame.setLocation(0, 0);
  //background(255);

  //(longitud de hueso, pivote izquierdo X, pivote izquierdo Y, pivote derecho X, pivote derecho Y); 
  unico = new brazo(600, izquierdo.posX, izquierdo.posY, derecho.posX, derecho.posY);

  //izquierdo.dibujar();
  izquierdo.girar(0.101);

  //derecho.dibujar();
  derecho.girar(-1.05);

  unico.crear();
  //unico.dibujar();
  //(puntoX, puntoY, escala, posición en X, posición en Y, stroke, strokeWeight);
  unico.trazo(unico.xD, unico.yD, 0.2  , 200, 400, c, 1);
}

