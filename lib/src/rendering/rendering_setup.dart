part of dash;

class RenderingSetup {
  Resolution resolution;
  HTML.CanvasElement canvas;
  
  RenderingSetup() {
    resolution = new Resolution(600, 400);
    canvas = new HTML.CanvasElement();
    canvas.width = resolution.width;
    canvas.height = resolution.height;
  }
}
