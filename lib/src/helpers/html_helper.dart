part of dash;

class HTMLHelper {
  static String formatAsRGBA(Color color) {
    int red = (color.red*255).round();
    int green = (color.green*255).round();
    int blue = (color.blue*255).round();
    
    return "rgba(${red}, ${green}, ${blue}, ${color.transparency})";
  }
}
