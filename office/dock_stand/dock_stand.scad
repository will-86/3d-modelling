// Render Control
$fa = 1;
$fs = 0.4;

// Dimensions
dock_thickness = 20;
dock_height = 125;
dock_width = 60;
height = 75;
footprint_width = 75;
footprint_depth = 75;
footprint_height = 5;

wall = 2;

// Calculated Dimensions
dock_curve_radius = dock_thickness / 2;

// Model

// Base
cube([footprint_width, footprint_depth, footprint_height]);

// Stand
translate([(footprint_width - dock_width) / 2, (footprint_depth - (dock_thickness + (2 * wall))) / 2, footprint_height]) {
  difference() {
    cube([dock_width, dock_thickness + (2 * wall), height + (dock_height / 2)]);

    hull() {
      translate([0, dock_curve_radius + wall, height + dock_curve_radius]) {
        rotate([0, 90, 0]) {
          cylinder(h = dock_width, r = dock_curve_radius);
        }
      }

      translate([0, dock_curve_radius + wall, height + (dock_height / 2)]) {
        rotate([0, 90, 0]) {
          cylinder(h = dock_width, r = dock_curve_radius);
        }
      }
    }
  }
}
