// Render Controls
$fa = 1;
$fs = 0.4;

// Dimensions
standoffRadius = 2.5;
standoffHeight = 9;
screwSize = 2.5;

// Module
module standoff() {
    difference() {
        cylinder(r=standoffRadius, h=standoffHeight);
        cylinder(r=screwSize / 2, h=standoffHeight);
    }
}

// Model
render() {
    standoff();
}
