// Render Control
$fa = 1;
$fs = 0.4;

// Dimensions: Badger
widthBadger = 86;
heightBadger = 49;

// Dimensions: Badger Plate
offsetHole = 2;
radiusHole = 1.5;

// Dimensions: ID Card
widthCard = 86;
heightCard = 55;
depthCard = 1.25;

// Dimensions: Fixings
lengthScrew = 3;
lengthNut = 1;
radiusNut = 2.2;

// Dimensions: General
radiusPlate = 1;
heightWall = 2;
bufferPlate = 2;
overhangWall = 2;

// Module: Hull
module hull_cyl() {
    cylinder(r=radiusPlate, h=lengthScrew + heightWall);
}

module hull_nut() {
    linear_extrude(height=lengthNut) {
        circle(r=radiusNut, $fn=6);
    }
    translate([0, 0, lengthNut - lengthScrew]) {
        cylinder(r=radiusHole, h=lengthScrew - lengthNut);
    }
}

// Model
render() {
    difference() {
        // Main Plate Body
        hull(){
            translate([radiusPlate, radiusPlate, 0]) {
                hull_cyl();
            }

            translate([widthCard + (2 * bufferPlate) - radiusPlate, radiusPlate, 0]) {
                hull_cyl();
            }

            translate([radiusPlate, heightCard + (2 * bufferPlate) - radiusPlate, 0]) {
                hull_cyl();
            }

            translate([widthCard + (2 * bufferPlate) - radiusPlate, heightCard + (2 * bufferPlate) - radiusPlate, 0]) {
                hull_cyl();
            }
        }

        // Subtract hole for screw/nut - bottom-left
        translate([bufferPlate + offsetHole + radiusHole, bufferPlate + ((heightCard - heightBadger) / 2) + offsetHole + radiusHole, lengthScrew - lengthNut]) {
            hull_nut();
        }

        // Subtract hole for screw/nut - bottom-right
        translate([bufferPlate + widthBadger - (offsetHole + radiusHole), bufferPlate + ((heightCard - heightBadger) / 2) + offsetHole + radiusHole, lengthScrew - lengthNut]) {
            hull_nut();
        }

        // Subtract hole for screw/nut - top-left
        translate([bufferPlate + offsetHole + radiusHole, bufferPlate + heightBadger + ((heightCard - heightBadger) / 2) - (offsetHole + radiusHole), lengthScrew - lengthNut]) {
            hull_nut();
        }

        // Subtract hole for screw/nut - top-right
        translate([bufferPlate + widthBadger - (offsetHole + radiusHole), bufferPlate + heightBadger + ((heightCard - heightBadger) / 2) - (offsetHole + radiusHole), lengthScrew - lengthNut]) {
            hull_nut();
        }

        // Subtract space for the card to sit in
        translate([bufferPlate, bufferPlate, lengthScrew]) {
            cube([widthCard + bufferPlate, heightCard, depthCard]);
        }

        // Subtract space for card to be visible through
 /*       translate([bufferPlate + overhangWall, bufferPlate + overhangWall, lengthScrew + depthCard]) {
            cube([widthCard - overhangWall, heightCard - (2 * overhangWall), heightWall - depthCard]);
        }
*/
 /*
        // Subtract right-hand portion of view fram to allow for card removal
        translate([bufferPlate + widthCard, bufferPlate + overhangWall, lengthScrew + depthCard]) {
            cube([bufferPlate, heightCard - (2 * overhangWall), heightWall - depthCard]);
        } */
    }
}
