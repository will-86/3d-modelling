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

// Dimensions: Battery Holders
heightSupport = 10;
lengthSupport = 20;
widthSupport = 1.5;
depthSupport = 5;
offsetSupport = 21;

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
        translate([
            offsetHole + radiusHole, 
            offsetHole + radiusHole, 
            0
        ])
            cylinder(r=radiusHole, h=depthPlate);

        translate([
            widthBadger - (offsetHole + radiusHole), 
            offsetHole + radiusHole, 
            0
        ])
            cylinder(r=radiusHole, h=depthPlate);

        translate([
            offsetHole + radiusHole, 
            heightBadger - (offsetHole + radiusHole), 
            0
        ])
            cylinder(r=radiusHole, h=depthPlate);

        translate([
            widthBadger - (offsetHole + radiusHole), 
            heightBadger - (offsetHole + radiusHole), 
            0
        ])
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

    // Battery Holder
    translate([0, (heightBadger - heightSupport) / 2, 0])
        cube([widthSupport, heightSupport, depthPlate + depthSupport]);

    translate([widthBadger - widthSupport, (heightBadger - heightSupport) / 2, 0])
        cube([widthSupport, heightSupport, depthPlate + depthSupport]);

    translate([offsetSupport - (lengthSupport / 2), 0, 0])
        cube([lengthSupport, widthSupport, depthPlate + depthSupport]);
}
