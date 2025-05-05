total_width = 210.4; //mm
rack_unit_height = 44.45; //mm
shelf_height_units = 3;
shelf_height = shelf_height_units * rack_unit_height; //mm
shelf_thickness = 1.4; //mm
wall_thickness = 3.6; //mm
rack_width = 250; //mm
rack_hole_offset = 7;

// disks
wide_disk_count = 3;
slim_disk_count = 5;
wide_disk_width = 26; //mm
slim_disk_width = 20; //mm
disk_height = 28; //mm
disk_length = 145; //mm

// holes
hole_diameter = 4; //mm
hole_disk_x_offset = 6.5; //mm
hole_disk_y_offset = [28, 70, 130]; //mm
hole_depth = 4; //mm

// modules
module base() {
  cube([total_width, disk_length, shelf_thickness], center = [true, false, false]);
}

module outer_wall() {
  polyhedron([
      [0,0,0], [wall_thickness, 0, 0], [wall_thickness, disk_length, 0], [0, disk_length, 0], // Base (0-3)
      [0, disk_length, disk_height], [wall_thickness, disk_length, disk_height], // Rear (4-5)
      [0, 0, shelf_height], [wall_thickness, 0, shelf_height] //Front (6-7)
    ], [
      [0,1,2,3], // Base
      [3,2,5,4], // Rear
      [0,1,7,6], // Front
      [0,3,4,6], // Left
      [1,2,5,7], // Right
      [6,7,5,4] // Top
    ]);
}

module disk_wall() {
  cube([wall_thickness, disk_length, disk_height]);
}

module disk_pin() {
  cylinder(h = shelf_thickness + hole_depth, r = hole_diameter / 2, center = [true, false, false]);
}

module rack_bracket(side="left"){

}

// disk shelf
base();

for (i = [0 : wide_disk_count]) {
  translate ([i * (wide_disk_width + wall_thickness), 0, 0]) {
    disk_wall();

    for (j = hole_disk_y_offset) {
      translate([wall_thickness + hole_disk_x_offset, j, 0]) {
        disk_pin();
      }
    }
  }
}
translate([(wide_disk_count * (wide_disk_width + wall_thickness)) + wall_thickness, 0, 0]) {
  for (i = [1 : slim_disk_count]) {
    translate ([i * (slim_disk_width + wall_thickness), 0, 0]) {
      disk_wall();

      if (i < slim_disk_count) {
        for (j = hole_disk_y_offset) {
          translate([wall_thickness + hole_disk_x_offset, j, 0]) {
            disk_pin();
          }
        }
      }
    }
  }
}
