/*
  Phone Dimensions
    Width: ~78mm
    Depth: ~8mm
    Height: ~160mm

  Recline: 15 degrees
*/

phoneWidth = 80;
phoneDepth = 10;
phoneHeight = 160;

angle = 15;

baseDepth = 45;
baseThickness = 5;
baseWall = 2;

module holder(ARGS) {
  translate ([0, -baseThickness, 0]) {
    rotate(-angle, [1, 0, 0]) {
      cube([phoneWidth, baseThickness, phoneHeight/2]);

      translate([0, -phoneDepth, 0]) {
        cube([phoneWidth, phoneDepth + baseThickness, baseThickness]);
        cube([phoneWidth, baseWall, baseThickness * 2]);
      }
    }
  }

  translate([phoneWidth,0,0]) {
    rotate(-90, [0,0,1]) {
      rotate(90, [1,0,0]) {
        rotate_extrude(angle=angle, convexity = 10) {
          square(size = [phoneDepth + baseThickness, phoneWidth]);
        }
      }
    }
  }
}

module flat() {
  translate([0,-(phoneWidth / 2),-baseThickness]) {
    cube([phoneWidth, phoneWidth, baseThickness]);
  }
}

difference() {
  holder();

  flat();
}

cube([phoneWidth, baseDepth, baseWall]);
