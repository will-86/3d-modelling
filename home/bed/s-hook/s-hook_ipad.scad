// iPad Dimensions
ipad_l = 250;
ipad_w = 175;
ipad_d = 5;

// Frame dimension
frame_t = 20;
frame_p = 3;

// Constants
thickness = 10;
width = 5;

// Calculated Sizes
// Main Strut
ms = 0.75 * ipad_l;
// Small hook
sh_b = 2 * (ipad_d + width + 5);
sh_s = 25;

// Large Hook
lh_t = frame_t + frame_p + (2 * width);
lh_s = 30;

// Main Model Construction
// Main Strut
color("red")
    cube([ms, width, thickness]);

// Small hook to hold iPad
color("blue")
    cube([width, sh_b, thickness]);
color("aqua")
    translate([0, sh_b - width, 0])
        cube([sh_s, width, thickness]);

// Large hook to attach to frame
color("green")
    translate([ms - width, width - lh_t, 0])
        cube([width, lh_t, thickness]);
color("yellow")
    translate([ms - lh_s, width - lh_t, 0])
        cube([lh_s, width, thickness]);
