// Render Control
$fa = 1;
$fs = 0.4;

// Dimensions: Badger
widthBadger = 86;
heightBadger = 49;

// Dimensions: Card
widthCard = 86;
heightCard = 55;

// Dimensions: Card Retainer
thickWall = 3;
heightWall = 1.5;
overlapWall = 2;
bufferWall = 3;

// Dimensions: Fixings
radiusHole = 3 / 2;
diameterNut = 4;
offsetHole = 2;
radiusStrut = 5 / 2;

// Dimensions: General
depthPlate = 2;
radiusPlate = 1;

// Calculations
plateWidth = widthCard + thickWall + bufferWall; // 86 + 3 + 3 = 92
plateHeight = heightCard + thickWall + bufferWall; // 55 + 3 + 3 = 61

// Model: Card Plate
render() {
    // difference() {
        hull() {
            translate([radiusPlate, radiusPlate, 0])
                cylinder(r=radiusPlate, h=depthPlate);

            translate([plateWidth - radiusPlate, radiusPlate, 0])
                cylinder(r=radiusPlate, h=depthPlate);

            translate([radiusPlate, plateHeight - radiusPlate, 0])
                cylinder(r=radiusPlate, h=depthPlate);

            translate([plateWidth - radiusPlate, plateHeight - radiusPlate, 0])
                cylinder(r=radiusPlate, h=depthPlate);
        }

    //     translate([offsetHole + radiusHole, offsetHole + radiusHole + (heightCard - heightBadger), 0]) {
    //         cylinder(r=radiusHole, h=depthPlate / 2);
    //         translate([0,0,1])
    //             cylinder(r=diameterNut / 2, h=depthPlate / 2, $fn = 6);
    //     }

    //     translate([offsetHole + radiusHole, heightCard + offsetHole + radiusHole + (heightCard - heightBadger), 0]) {
    //         cylinder(r=radiusHole, h=depthPlate / 2);
    //         translate([0,0,1])
    //             cylinder(r=diameterNut / 2, h=depthPlate / 2, $fn = 6);
    //     }

    //     translate([offsetHole + radiusHole, offsetHole + radiusHole + (heightCard - heightBadger), 0]) {
    //         cylinder(r=radiusHole, h=depthPlate / 2);
    //         translate([0,0,1])
    //             cylinder(r=diameterNut / 2, h=depthPlate / 2, $fn = 6);
    //     }

    //     translate([offsetHole + radiusHole, offsetHole + radiusHole + (heightCard - heightBadger), 0]) {
    //         cylinder(r=radiusHole, h=depthPlate / 2);
    //         translate([0,0,1])
    //             cylinder(r=diameterNut / 2, h=depthPlate / 2, $fn = 6);
    //     }
    // }
}
