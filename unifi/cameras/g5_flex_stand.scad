camera_band_height = 30;
camera_diameter = 49;
camera_radius = camera_diameter / 2;

stand_height = 150;
stand_wall = 2;

notch_width = 16;

plate_angle = 15;
plate_depth = 5

cylinder_height = stand_height + camera_band_height;

difference() {
    // outer tube
    cylinder(h = cylinder_height, r = camera_radius + stand_wall);

    // inner tube
    cylinder(h = cylinder_height, r = camera_radius);

    // flat plate
    translate ([0, 0, 30]) {
      rotate ([15, 0, 0]) {
        cube ([60, 60, 2], center = true);
      }
    } 
}