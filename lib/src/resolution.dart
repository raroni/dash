part of dash;

class Resolution {   
  int width = 600;
  int height = 400;
  
  num get aspectRatio => width/height;
  
  Resolution(int this.width, int this.height);
}
