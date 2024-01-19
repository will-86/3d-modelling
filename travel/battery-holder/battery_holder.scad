// Dimensions
batteryWidth = 10.25;
batteryHeight = 42.3;

thickness = 2;

rows = 4;
columns = 3;

difference () {
  cube([(rows * batteryWidth) + (2 * thickness), (columns * batteryWidth) + (2 * thickness), batteryHeight + thickness]);

  translate([thickness, thickness, thickness]) {
    cube([rows * batteryWidth, columns * batteryWidth, batteryHeight]);
  }
}
