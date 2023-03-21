// Dimensions
trayLength = 210;
trayWidth = 75;
trayHeight = 1;

wallHeight = 10;
wallDepth = 1;

// Model
// Tray Base
cube([trayLength + (2 * wallDepth), trayWidth + (2 * wallDepth), trayHeight]);
// Tray Walls (Long Sides)
cube([trayLength + (2 * wallDepth), wallDepth, wallHeight]);
translate([0,trayWidth + wallDepth, 0]) {
    cube([trayLength + (2 * wallDepth), wallDepth, wallHeight]);
}
// Tray Walls (Short Sides)
cube([wallDepth, trayWidth + (2 * wallDepth), wallHeight]);
translate([trayLength + wallDepth, 0, 0]) {
    cube([wallDepth, trayWidth + (2 * wallDepth), wallHeight]);
}
