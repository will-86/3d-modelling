// Dimensions

bottleDiameter = 75;
rodDiameter = 24.5;
cotRodGap = 18;
wallHeight = 50;
totalHeight = 150;
wallThickness = 5;
claspAngle = 180;
tabWidth = 20;
hookThickness = 10;
length = 200;
slotHeight = wallHeight / 2;
slotWidth = wallThickness / 2;

tabAngle = 4;
tabOffset = 10;

// Modules

module hook() {
  rotate_extrude(angle = claspAngle, convexity = 10, $fn = 360) {
    translate([rodDiameter /2, 0]) {
      square(hookThickness);
    }
  }
}

module arm() {
  cube([hookThickness, hookThickness, totalHeight]);

  translate([hookThickness, (hookThickness - slotWidth) / 2, 0]) {
    difference() {
      cube([wallThickness, slotWidth, slotHeight]);

      cube([slotWidth, slotWidth / 4, slotHeight]);

      translate([0, 3 * slotWidth / 4, 0]) {
      cube([slotWidth, slotWidth / 4, slotHeight]);
      } 
    }
  }

  translate([-(hookThickness + slotWidth), hookThickness, totalHeight]) {
    rotate(a=[90, 0, 0]) {
      hook();
    }
  }
}

module box() {
  difference() {
    cube([length + (2 * wallThickness), bottleDiameter + (2 * wallThickness), wallHeight + wallThickness]);

    translate([wallThickness, wallThickness, wallThickness]) {
      cube([length, bottleDiameter, wallHeight]);
    }
  }
}

// Assembly

box();

translate([300,0,0]) {
  rotate([0, 0, 90]) {
    arm();
  } 
}


module tray() {
  difference() {
    cube([length + (2 * wallThickness), bottleDiameter + (2 * wallThickness), wallHeight + wallThickness]);

    translate([wallThickness, wallThickness, wallThickness]) {
      cube([length, bottleDiameter, wallHeight]);
    }
  }
}

tray();

translate([0, -(wallThickness + hookThickness), totalHeight]) {
  rotate(a=[90, 0, 90]) {
    arm();
  }
}

translate([length + (2 * wallThickness) - hookThickness, -(wallThickness + hookThickness), totalHeight]) {
  rotate(a=[90, 0, 90]) {
    arm();
  }
}

translate([-tabWidth, 0, 0]) {
  cube([tabWidth, wallThickness, wallThickness + wallHeight]);
}
