// Render Control
$fa = 1;
$fs = 0.4;

// Dowel dimensions
dowel_diameter = 18;
dowel_radius = dowel_diameter / 2;

// Screw dimensions
screw_diameter = 3;
screw_radius = screw_diameter / 2;
screw_offset = 14;

// Bungee dimensions
bungee_diameter = 8;
bungee_radius = bungee_diameter / 2;

// Cap dimensions
cap_thickness = 1.96;
cap_length = 2 * screw_offset;

// Body
difference() {
  cylinder(h = cap_length + cap_thickness, r = dowel_radius + cap_thickness + bungee_radius);

  cylinder(h = cap_length, r=dowel_radius);

  translate([0,0,screw_offset]) {
    rotate_extrude(angle = 360) {
      translate([dowel_radius + cap_thickness + bungee_radius, 0])
          circle(r = bungee_radius);
    }
  }

  translate([0,dowel_radius + (2 * cap_thickness), screw_offset]) {
    rotate(a = 90, v = [1,0,0]) {
    cylinder(h = 2 * cap_thickness, r = screw_radius);
    }
  }

}
