// Render Control
$fa = 1;
$fs = 0.4;

// Dimensions: Badger
widthBadger = 86;
heightBadger = 49;

// Dimensions: Fixings
radiusHole = 3 / 2;
lengthThread = 7;
offsetHole = 2;
radiusStrut = 5 / 2;

// Dimensions: General
depthPlate = 2;
radiusPlate = 1;

// Model: Badge Plate
render() {
    difference() {
        // Plate Body
        hull() {
            translate([radiusPlate, radiusPlate, 0])
                cylinder(r=radiusPlate, h=depthPlate);

            translate([widthBadger - radiusPlate, radiusPlate, 0])
                cylinder(r=radiusPlate, h=depthPlate);

            translate([radiusPlate, heightBadger - radiusPlate, 0])
                cylinder(r=radiusPlate, h=depthPlate);

            translate([widthBadger - radiusPlate, heightBadger - radiusPlate, 0])
                cylinder(r=radiusPlate, h=depthPlate);
        }
        
        // Subtract Holes for the screw threads
        translate([offsetHole + radiusHole, offsetHole + radiusHole, 0])
            cylinder(r=radiusHole, h=depthPlate);

        translate([widthBadger - (offsetHole + radiusHole), offsetHole + radiusHole, 0])
            cylinder(r=radiusHole, h=depthPlate);

        translate([offsetHole + radiusHole, heightBadger - (offsetHole + radiusHole), 0])
            cylinder(r=radiusHole, h=depthPlate);

        translate([widthBadger - (offsetHole + radiusHole), heightBadger - (offsetHole + radiusHole), 0])
            cylinder(r=radiusHole, h=depthPlate);

    }

    // Screw Struts
    translate([offsetHole + radiusHole, offsetHole + radiusHole, 0])
        difference() {
            // Support Body
            cylinder(r=radiusStrut, h=lengthThread + depthPlate);

            // Thread hole
            cylinder(r=radiusHole, h=lengthThread + depthPlate);
        }

    translate([widthBadger - (offsetHole + radiusHole), offsetHole + radiusHole, 0])
        difference() {
            // Support Body
            cylinder(r=radiusStrut, h=lengthThread + depthPlate);

            // Thread hole
            cylinder(r=radiusHole, h=lengthThread + depthPlate);
        }

    translate([offsetHole + radiusHole, heightBadger - (offsetHole + radiusHole), 0])
        difference() {
            // Support Body
            cylinder(r=radiusStrut, h=lengthThread + depthPlate);

            // Thread hole
            cylinder(r=radiusHole, h=lengthThread + depthPlate);
        }

    translate([widthBadger - (offsetHole + radiusHole), heightBadger - (offsetHole + radiusHole), 0])
        difference() {
            // Support Body
            cylinder(r=radiusStrut, h=lengthThread + depthPlate);

            // Thread hole
            cylinder(r=radiusHole, h=lengthThread + depthPlate);
        }
}
