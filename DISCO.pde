class disco
{
  //Pivote
  float posX;
  float posY;

  //Origen del disco
  float centX;
  float centY;

  //Radio del disco
  float radio;

  //Distancia entre O. del disco y el pivote
  float distancia;

  //Ángulo de giro
  float theta;

  //Constructor con argumentos
  disco(float r, float dt, float angulo, float x, float y)
  {
    radio = r;
    centX = x;
    centY = y;
    distancia = dt;
    //Limitar distancia del pivote
    if (distancia > radio)
    {
      distancia = radio - radio/10;
    }
    theta = -angulo;

    //Coordenadas polares
    posX = distancia * cos(radians(theta)) + centX;
    posY = distancia * sin(radians(theta)) + centY;
  }

  void dibujar()
  {        
    noFill();
    //Disco
    ellipse(centX, centY, 2*radio, 2*radio);
    //Pivote
    ellipse(posX, posY, radio/5, radio/5);
  }

  void girar(float frecuencia)
  {
    if (key==' ')
    {
      theta += frecuencia;
    }

    posX = distancia * cos(radians(theta)) + centX;
    posY = distancia * sin(radians(theta)) + centY;
  }
}

