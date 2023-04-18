/*
  Landing Rail Dimensions
    Height: ~140.0mm
    Depth: 19.5mm

  Drier Arm Dimensions
    Height: ~70.0mm
    Width: ~12.0mm
    Depth: ~23.6mm
*/

railHeight = 140;
railDepth = 19.5;

armHeight = 70;
armWidth = 12;
armDepth = 23.6;

wallThickness = 5;


// Drier Arm Holder Piece
difference() {
  cube([armWidth + (2 * wallThickness), armDepth + (2 * wallThickness), armHeight + wallThickness]);

  translate([wallThickness, wallThickness, wallThickness]) {
    cube([armWidth, armDepth, armHeight]);
  }
}

// Railing Bracket
translate ([0, armDepth + wallThickness, 0]) {
  cube([armWidth + (2 * wallThickness), wallThickness, railHeight + (2 * wallThickness)]);
  // cube([armWidth + (2 * wallThickness), railDepth + (2 * wallThickness), wallThickness]);

  // translate([0, railDepth + wallThickness, 0]) {
  //   cube([armWidth + (2 * wallThickness), wallThickness, 5 * wallThickness]);
  // }

  translate([0, 0, railHeight + wallThickness]) {
    cube([armWidth + (2 * wallThickness), railDepth + (2 * wallThickness), wallThickness]);

    translate([0, railDepth + wallThickness, -(4 * wallThickness)]) {
      cube([armWidth + (2 * wallThickness), wallThickness, 5 * wallThickness]);
    }
  }
}
