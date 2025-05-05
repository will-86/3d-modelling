// Rack fan front plate with 2x 120mm and 2x 90mm fans
// Designed for 2U rack height (88.9mm), customizable width (e.g., 10" rack = 254mm)
unit_height = 44.45; // 1U height in mm

rack_width = 250;         // Customize as needed (standard 10" rack)
rack_height = 3 * unit_height;       // 2U height in mm
plate_thickness = 2.8;    // Set to match layer height (0.28mm * 10)

cutout_width = 20;
rack_screw_radius = 3;
rack_screw_offset = 7;

fan_width = 120; // Fan width in mm
fan_screw_radius = 3;
fan_screw_offset = 8;
fan_corner_buffer = 24;

difference() {
  union() {
    difference() {
      cube([rack_width, rack_height, plate_thickness]);

      for (x = [0, rack_width]) {
        for (y = [6.35, 22.225, 38.1]) {
          for (y1 = [0, unit_height]) {
            translate([(x == 0) ? rack_screw_offset : x - rack_screw_offset, y + y1, 0]) {
              cylinder(h = plate_thickness, r = rack_screw_radius);
            }
          }
        }

        translate([(x == 0) ? 0 : x - cutout_width, 2 * unit_height, 0]) {
          cube([cutout_width, unit_height, plate_thickness]);
        }
      }

      translate([(rack_width / 2) - (fan_width / 2) + 5, (rack_height / 2) - (fan_width / 2) + 5, 0]) {
        difference() {
          cube([fan_width - 10, fan_width - 10, plate_thickness]);

          hex_size = 8;
          hex_height = sqrt(3) * hex_size;
          linear_extrude(height = plate_thickness) {
            difference() {
              square([fan_width - 10, fan_width - 10], center=false);
              union() {
                for (x = [0 : hex_size*1.1 : fan_width - 10]) {
                  for (y = [0 : hex_height*0.6 : fan_width - 10]) {
                    translate([x + ((floor(y/hex_height) % 2) * hex_size * 0.55), y]) {
                      circle(r=hex_size/2, $fn=6);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    translate([rack_width / 2, rack_height / 2, 0]) {
      for (i = [0 : 3]) {
        rotate([0, 0, i * 90]) {
          translate([-fan_width/2, -fan_width/2, 0]) {
            linear_extrude(height = plate_thickness) {
              points = [[0, 0], [fan_corner_buffer, 0], [0, fan_corner_buffer]];
              paths = [[0, 2, 1]];
              convexity = 10;
              polygon(points = points, paths = paths, convexity = convexity);
            }
          }
        }
      }
    }
  }

  translate([rack_width / 2, rack_height / 2, 0]) {
    for (i = [0 : 3]) {
      rotate([0, 0, i * 90]) {
        translate([fan_width/2 - fan_screw_offset, fan_width/2 - fan_screw_offset, 0]) {
          cylinder(h = plate_thickness, r = fan_screw_radius);
        }
      }
    }
  }
}
