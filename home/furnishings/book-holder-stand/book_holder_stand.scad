// Render Control
$fa = 1;
$fs = 0.4;

/*
  Book Dimensions
    Width: ~150mm
    Depth: ~15mm
    Height: ~200mm

  Recline: 30 degrees

  *** Remember, the book will be approximately twice as wide when open! It will also be deeper! ***
*/

bookStandRatio = 1.5;

bookWidth = 150;
bookDepth = 15;
bookHeight = 200;

angle = 30;

baseDepth = 80;
baseThickness = 5;
baseWall = 2;

standWidth = bookStandRatio * bookWidth;
standDepth = bookStandRatio * bookDepth;

module stand() {
  rotate([angle,0,0]) {
    // Back
    translate ([0, 0, baseThickness]) {
      cube ([standWidth, baseThickness, bookHeight / 2]);
    }
    // Bottom
      cube ([standWidth, standDepth + baseWall + baseThickness, baseThickness]);
    // Front
    translate ([0, standDepth + baseThickness, baseThickness]) {
      cube ([standWidth, baseWall, baseThickness]);
    }
  }

  rotate ([90, 0, 90]) {
    rotate_extrude (angle = angle) {
      square ([standDepth + baseWall + baseThickness, standWidth]);
    }
  }

  translate ([0, -baseDepth, 0]) {
    cube ([standWidth, baseDepth, baseThickness]);
  }
}

render() {
  stand();
}

module holder(ARGS) {
  translate ([0, -baseThickness, 0]) {
    rotate(-angle, [1, 0, 0]) {
      cube([standWidth, baseThickness, bookHeight / 2]);

      translate([0, -standDepth, 0]) {
        cube([standWidth, standDepth + baseThickness, baseThickness]);
        cube([standWidth, baseWall, baseThickness * 2]);
      }
    }
  }

  translate([standWidth,0,0]) {
    rotate(-90, [0,0,1]) {
      rotate(90, [1,0,0]) {
        rotate_extrude(angle=angle, convexity = 10) {
          square(size = [standDepth + baseThickness, standWidth]);
        }
      }
    }
  }
}

module flat() {
  translate([0,-(standWidth / 2),-baseThickness]) {
    cube([standWidth, standWidth, baseThickness]);
  }
}
