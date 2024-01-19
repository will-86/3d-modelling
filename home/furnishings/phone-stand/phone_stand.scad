// Render Control
$fa = 1;
$fs = 0.4;
/*
  Phone Dimensions
    Width: ~78mm
    Depth: ~8mm
    Height: ~160mm

  Recline: 15 degrees
*/

phoneWidth = 80;
phoneDepth = 10.5;
phoneHeight = 160;

angle = 30;

baseDepth = 50;
baseThickness = 5;
baseWall = 2;


module stand() {
  rotate([angle,0,0]) {
    // Back
    translate ([0, 0, baseThickness]) {
      cube ([phoneWidth, baseThickness, phoneHeight / 2]);
    }
    // Bottom
      cube ([phoneWidth, phoneDepth + baseWall + baseThickness, baseThickness]);
    // Front
    translate ([0, phoneDepth + baseThickness, baseThickness]) {
      cube ([phoneWidth, baseWall, baseThickness]);
    }
  }

  rotate ([90, 0, 90]) {
    rotate_extrude (angle = angle) {
      square ([phoneDepth + baseWall + baseThickness, phoneWidth]);
    }
  }

  translate ([0, -baseDepth, 0]) {
    cube ([phoneWidth, baseDepth, baseThickness]);
  }
}

render() {
  stand();
}

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

// holder();

// difference() {
//   holder();

  // flat();
// }

// cube([phoneWidth, baseDepth, baseWall]);
