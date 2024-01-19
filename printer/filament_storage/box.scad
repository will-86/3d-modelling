// Set box dimensions
spool_width = 63;
spool_radius = 100;
mdf_thickness = 4;
spool_count = 10;

// Create the box

// Modules
module main_panel() {
  cube([(spool_width * spool_count) + (2 * mdf_thickness), 2 * (mdf_thickness + spool_radius), mdf_thickness]);
}

module side_panel() {
  cube([2 * (mdf_thickness + spool_radius), 2 * (mdf_thickness + spool_radius), mdf_thickness]);
}

module lid_pins() {

}

// Base panel
main_panel();

// Side panels
translate([-(2 * (mdf_thickness + spool_radius) + 50),0,0]) {
  side_panel();
}

translate([(spool_width * spool_count) + (2 * mdf_thickness) + 50, 0, 0]) {
  side_panel();
}

// Front/Back panels
translate([0, 2 * (mdf_thickness + spool_radius) + 50, 0]) {
  main_panel();
}

translate([0, -(50 + (2 * (mdf_thickness + spool_radius))), 0]) {
  main_panel();
}

// Lid
translate([0, 2 * (2 * (mdf_thickness + spool_radius) + 50), 0]) {
  main_panel();
}
