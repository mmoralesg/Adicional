class brazo
{
  //Longitud
  float base;
  float altura;
  float segmento;

  //Pendientes
  float pendienteBase;
  float pendienteSegIzq;

  //Ángulos
  float angBase;
  float angAltura;
  float angSegIzq;

  //Coordenadas
  float xA, xB, xC, xD;
  float yA, yB, yC, yD;
  float xIzq, xDer, yIzq, yDer;


  brazo(float hue, float xizq, float yizq, float xder, float yder)
  {
    xIzq = xizq;
    xDer = xder;
    yIzq = yizq;
    yDer = yder;

    segmento = hue;
    base = dist(xIzq, yIzq, xDer, yDer);
    altura = sqrt(sq(segmento) - sq(base/2));

    pendienteBase = (yIzq - yDer)/(xIzq - xDer);

    angBase = atan(pendienteBase);
    angAltura = acos(altura/segmento);
    angSegIzq = angBase + angAltura;
  }



  void crear()
  {
    xA = altura * cos(angBase-HALF_PI) + (xIzq+xDer)/2;
    yA = altura * sin(angBase-HALF_PI) + (yIzq+yDer)/2;

    xB = segmento/2 * cos(angSegIzq-HALF_PI) + xA;
    yB = segmento/2 * sin(angSegIzq-HALF_PI) + yA;

    xC = segmento/2 * cos(atan((yA-yDer)/(xA-xDer))-PI) + xA;
    yC = segmento/2 * sin(atan((yA-yDer)/(xA-xDer))-PI) + yA;

    float base = dist(xB, yB, xC, yC);
    float pendienteBase = (yB-yC)/(xB-xC);
    float altura = sqrt(sq(segmento)-sq(base/2));
    float ang = atan(pendienteBase);
    float angA = acos(altura/segmento);
    float angAB = ang + angA;

    xD = segmento/2 * cos(ang-HALF_PI) + (xC+xB)/2;
    yD = segmento/2 * sin(ang-HALF_PI) + (yC+yB)/2;
  }

  void dibujar()
  {
    line(xIzq, yIzq, xA, yA);
    line(xDer, yDer, xA, yA);
    line(xA, yA, xB, yB);
    line(xA, yA, xC, yC);
    line(xB, yB, xD, yD);
    line(xC, yC, xD, yD);
  }

  void trazo(float x, float y, float escala, float posX, float posY, color st, float stW)
  {
    stroke(st);
    strokeWeight(stW);
    point(x*escala + posX, y*escala + posY);
    //Guardar imagen
    if (keyPressed)
    {
      if (key=='a')
      {
        saveFrame(frameCount + ".jpg");
      }
    }
  }
}

